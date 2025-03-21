"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

load("//playwright/private:util.bzl", "get_browsers_json_path", "get_cli_path", "load_playwright_from_attrs")
load("//playwright/private:known_browsers.bzl", "KNOWN_BROWSER_INTEGRITY")

def _playwright_repo_impl(ctx):
    playwright_version = load_playwright_from_attrs(
        ctx,
        ctx.attr.playwright_version,
        ctx.attr.playwright_version_from,
    )
    result = ctx.execute(
        [
            get_cli_path(ctx),
            "workspace",
            "--browser-json-path",
            get_browsers_json_path(ctx, playwright_version, ctx.attr.browsers_json),
            "--workspace-name",
            ctx.attr.user_workspace_name,
        ],
    )

    if result.return_code != 0:
        fail(ctx.attr.user_workspace_name, "workspace command failed", result.stdout, result.stderr)

playwright_repository = repository_rule(
    _playwright_repo_impl,
    doc = "Fetch external tools needed for playwright toolchain",
    attrs = {
        "playwright_version": attr.string(
            mandatory = False,
            doc = "The version of playwright to install",
        ),
        "playwright_version_from": attr.label(
            mandatory = False,
            allow_single_file = [".json"],
            doc = "The package.json file to use to find the version of playwright to install",
        ),
        "browsers_json": attr.label(
            allow_single_file = True,
            doc = "The browsers.json file to use. For example https://unpkg.com/playwright-core@1.51.0/browsers.json",
        ),
        "user_workspace_name": attr.string(mandatory = True),
    },
)

def _define_browsers_impl(rctx):
    result = rctx.execute(
        [
            get_cli_path(rctx),
            "http-files",
            "--browser-json-path",
            rctx.path(rctx.attr.browsers_json),
            "--workspace-name",
            rctx.name,
        ],
    )
    if result.return_code != 0:
        fail("http-files command failed", result.stdout, result.stderr)

    result_build = [
        """load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")""",
        "def fetch_browsers():",
    ]

    # Create a new dictionary by merging the known browser integrity with the user-provided integrity
    # User-provided integrity takes precedence
    integrity_map = dict(KNOWN_BROWSER_INTEGRITY)
    for key, value in rctx.attr.browser_integrity.items():
        integrity_map[key] = value

    for http_file_json in json.decode(result.stdout):
        path = http_file_json["path"]
        integrity_attr = ""
        if path in integrity_map:
            integrity_attr = 'integrity = "{}",\n'.format(integrity_map[path])

        result_build.append("""\
        http_archive(
            name = "{name}",
            patch_cmds = [
                "touch DEPENDENCIES_VALIDATED",
                "touch INSTALLATION_COMPLETE",
            ],
            add_prefix = "browser",
            build_file_content = \"\"\"
filegroup(
name = "file",
srcs = ["browser"],
visibility = ["//visibility:public"],
)
\"\"\",
            {integrity} 
            urls = [
                "https://playwright.azureedge.net/{path}",
                "https://playwright-akamai.azureedge.net/{path}",
                "https://playwright-verizon.azureedge.net/{path}",
            ],
        )
""".format(
    name = http_file_json["name"],
    path = path,
    integrity = integrity_attr,
))
    rctx.file("browsers.bzl", "\n".join(result_build))
    rctx.file("BUILD", "# no targets")

define_browsers = repository_rule(
    implementation = _define_browsers_impl,
    attrs = {
        "browsers_json": attr.label(allow_single_file = True),
        "browser_integrity": attr.string_dict(
            doc = "A dictionary of browser names to their integrity hashes",
            default = {},
        ),
    },
)
