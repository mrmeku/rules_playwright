"""Utility functions used across multiple Starlark rules."""

def get_browser_workspace_gen_path(ctx):
    """Returns the platform-specific path to the browser workspace generator binary.

    Args:
        ctx: The Starlark context object containing OS information

    Returns:
        Path to the browser workspace generator binary for the current platform
    """
    arch = "arm64"
    if ctx.os.arch == "amd64":
        arch = "x86_64"

    platform = "unknown-linux-musl"
    if "mac" in ctx.os.name:
        platform = "apple-darwin"

    return ctx.path(Label("//tools/release:artifacts/browser_workspace_gen-{arch}-{platform}".format(platform = platform, arch = arch)))
