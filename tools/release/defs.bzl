"Make releases for platforms supported by rules_playwright"

load("@aspect_bazel_lib//lib:copy_file.bzl", "copy_file")
load("@rules_rust//rust:defs.bzl", _rust_binary = "rust_binary")

DEFAULT_OS = ["linux", "macos"]
DEFAULT_ARCHS = ["arm64", "x86_64"]

def _map_os_to_triple(os):
    if os == "linux":
        return "unknown-linux-musl"
    if os == "macos":
        return "apple-darwin"
    fail("Unrecognized os", os)

# buildozer: disable=function-docstring
def rust_binary(name, visibility = [], **kwargs):
    selection = {}
    for os in DEFAULT_OS:
        outs = []

        target_suffix = "{}_{}".format(name, os)
        target_compatible_with = ["@platforms//os:{}".format(os)]

        for arch in DEFAULT_ARCHS:
            arch_target_suffix = "{}_{}".format(target_suffix, arch)
            binary_name = "{}_build".format(arch_target_suffix)
            platform = "//tools/platforms:{}_{}".format(os, arch)
            release_platform = "//tools/release:{}_{}".format(os, arch)

            # Artifact naming follows typical Rust "triples" convention.
            artifact = "{}-{}-{}".format(name, arch, _map_os_to_triple(os))
            outs.append(artifact)

            selection.update([[platform, binary_name]])

            _rust_binary(
                name = binary_name,
                crate_name = name,
                platform = release_platform,
                target_compatible_with = target_compatible_with,
                rustc_flags = select({
                    "//tools/release": [
                        "-Ccodegen-units=1",
                        "-Cpanic=abort",
                        "-Copt-level=z",
                        "-Cstrip=symbols",
                    ],
                    "//conditions:default": [
                        "-Copt-level=0",
                    ],
                }),
                tags = ["manual"],
                **kwargs
            )

            copy_file(
                name = "copy_{}".format(arch_target_suffix),
                src = binary_name,
                out = artifact,
                tags = ["manual"],
            )

        native.filegroup(
            name = target_suffix,
            srcs = outs,
            tags = ["manual"],
            visibility = ["//tools/release:__pkg__"],
        )

    native.alias(
        name = name,
        actual = select(selection),
        visibility = visibility,
    )
