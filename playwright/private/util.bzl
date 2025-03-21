"""Utility functions used across multiple Starlark rules."""

_PLAYWRIGHT_PACKAGE = "playwright"
_PLAYWRIGHT_TEST_PACKAGE = "@playwright/test"
_PLAYWRIGHT_PACKAGES = [_PLAYWRIGHT_PACKAGE, _PLAYWRIGHT_TEST_PACKAGE]

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
        browsers_json_path = ctx.path(browsers_json)
    else:
        browsers_json_path = "browsers.json"
        ctx.download(
            url = "https://unpkg.com/playwright-core@{}/browsers.json".format(
                playwright_version,
            ),
            output = browsers_json_path,
        )
    return browsers_json_path

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

def _find_playwright_version_in_deps(deps_dict):
    for package in _PLAYWRIGHT_PACKAGES:
        if package in deps_dict:
            return deps_dict[package]
    return None

def _extract_playwright_version(package_json_data):
    version = _find_playwright_version_in_deps(package_json_data.get("dependencies", {}))
    if not version:
        version = _find_playwright_version_in_deps(package_json_data.get("devDependencies", {}))

    return version

def load_playwright_from_attrs(ctx, playwright_version, playwright_version_from):
    """Extracts and validates the Playwright version from repository rule attributes.

    Determines the Playwright version either directly from playwright_version attribute
    or by parsing the package.json specified in playwright_version_from. Ensures that
    exactly one version source is specified.

    Args:
        ctx: The repository context object containing the rule attributes.

    Returns:
        str: The resolved Playwright version.

    Fails:
        If neither or both playwright_version and playwright_version_from are set.
        If playwright_version_from is set but no Playwright version found in package.json.
    """
    if playwright_version and playwright_version_from:
        fail("playwright_version and playwright_version_from cannot both be set")

    if not playwright_version and not playwright_version_from:
        fail("one of playwright_version or playwright_version_from must be set")

    playwright_version = playwright_version

    if playwright_version_from:
        package_json_content = ctx.read(playwright_version_from)
        package_json_data = json.decode(package_json_content)
        playwright_version = _extract_playwright_version(package_json_data)
        if not playwright_version:
            fail("playwright not found in dependencies or devDependencies")

    return playwright_version
