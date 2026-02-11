"""Utility functions used across multiple Starlark rules."""

def get_browsers_json_path(ctx, playwright_version, browsers_json):
    """Retruns the path to a browsers.json file

    Args:
        ctx: The Starlark context object
        playwright_version: Optional playwright version
        browsers_json: Optional browsers json label

    Returns:
        Path to the browsers.json file
    """
    if browsers_json:
        return ctx.path(browsers_json)

    browsers_json_path = ctx.path("playwright-core")
    ctx.download_and_extract(
        url = "https://registry.npmjs.org/playwright-core/-/playwright-core-{}.tgz".format(
            playwright_version,
        ),
        output = browsers_json_path,
    )
    return ctx.path("playwright-core/package/browsers.json")

def get_cli_path(ctx):
    """Returns the platform-specific path to the browser workspace generator binary.

    Args:
        ctx: The Starlark context object containing OS information

    Returns:
        Path to the browser workspace generator binary for the current platform
    """
    arch = "arm64"
    if ctx.os.arch == "amd64" or ctx.os.arch == "x86_64":
        arch = "x86_64"

    platform = "unknown-linux-musl"
    if "mac" in ctx.os.name:
        platform = "apple-darwin"

    return ctx.path(Label("//tools/release:artifacts/cli-{arch}-{platform}".format(platform = platform, arch = arch)))

def get_all_cli_paths(ctx):
    """Returns paths to all platform-specific CLI binaries.

    Watching all CLI binaries (instead of just the current platform's) ensures
    MODULE.bazel.lock remains consistent across different host platforms.

    Args:
        ctx: The Starlark context object

    Returns:
        List of paths to all CLI binaries for all supported platforms
    """
    platforms = [
        ("arm64", "apple-darwin"),
        ("x86_64", "apple-darwin"),
        ("arm64", "unknown-linux-musl"),
        ("x86_64", "unknown-linux-musl"),
    ]
    return [
        ctx.path(Label("//tools/release:artifacts/cli-{arch}-{platform}".format(arch = arch, platform = platform)))
        for arch, platform in platforms
    ]
