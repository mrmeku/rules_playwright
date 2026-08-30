"""Playwright browser download path compatibility helpers."""

_CHROME_FOR_TESTING_MINIMUM = (1, 57, 0)

def browser_versions_from_json(content):
    """Returns browser names mapped to their browser versions.

    Args:
      content: The contents of Playwright's browsers.json file.

    Returns:
      A dictionary from browser name to exact browser version.
    """
    versions = {}
    for browser in json.decode(content).get("browsers", []):
        if browser.get("browserVersion"):
            versions[browser["name"]] = browser["browserVersion"]
    return versions

def _parse_version(version):
    normalized = version[1:] if version.startswith("v") else version
    core = normalized.split("-")[0].split("+")[0]
    parts = core.split(".")
    if len(parts) != 3:
        fail("playwright_version must contain major, minor, and patch components: {}".format(version))
    return (int(parts[0]), int(parts[1]), int(parts[2]))

def rewrite_browser_download_path(path, playwright_version, browser_versions):
    """Rewrites Chromium paths for Playwright's Chrome-for-Testing layout.

    Args:
      path: The revision-based download path emitted by the repository CLI.
      playwright_version: The exact Playwright package version.
      browser_versions: Browser names mapped to versions from browsers.json.

    Returns:
      The compatible pinned download path for this Playwright version.
    """
    if not playwright_version or _parse_version(playwright_version) < _CHROME_FOR_TESTING_MINIMUM:
        return path
    if not path.startswith("builds/chromium/"):
        return path

    browser_name = "chromium-headless-shell" if "headless-shell" in path else "chromium"
    browser_version = browser_versions.get(browser_name)
    if not browser_version:
        fail("{} has no browserVersion in browsers.json".format(browser_name))

    archive = None
    if path.endswith("/chromium-linux.zip"):
        archive = "linux64/chrome-linux64.zip"
    elif path.endswith("/chromium-headless-shell-linux.zip"):
        archive = "linux64/chrome-headless-shell-linux64.zip"
    elif path.endswith("/chromium-mac.zip"):
        archive = "mac-x64/chrome-mac-x64.zip"
    elif path.endswith("/chromium-headless-shell-mac.zip"):
        archive = "mac-x64/chrome-headless-shell-mac-x64.zip"
    elif path.endswith("/chromium-mac-arm64.zip"):
        archive = "mac-arm64/chrome-mac-arm64.zip"
    elif path.endswith("/chromium-headless-shell-mac-arm64.zip"):
        archive = "mac-arm64/chrome-headless-shell-mac-arm64.zip"

    # Playwright still publishes Linux ARM64 under the revision-based layout.
    if not archive:
        return path
    return "builds/cft/{}/{}".format(browser_version, archive)
