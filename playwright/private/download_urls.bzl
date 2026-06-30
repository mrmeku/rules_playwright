"""Helpers for browser archive download URLs."""

DEFAULT_BROWSERS_DOWNLOAD_URLS = [
    "https://playwright.azureedge.net",
    "https://playwright-akamai.azureedge.net",
    "https://playwright-verizon.azureedge.net",
]

_PATH_PLACEHOLDER = "{path}"

def browser_download_info(path, browsers_download_urls, browser_download_path_map, browser_download_url_map):
    """Returns the resolved archive path and URLs for a Playwright browser archive."""
    download_path = browser_download_path_map.get(path, path)
    download_url_templates = browser_download_url_map.get(path, browser_download_url_map.get(download_path, browsers_download_urls))
    return struct(
        path = download_path,
        urls = [_format_browser_download_url(url, download_path) for url in download_url_templates],
    )

def _format_browser_download_url(url, path):
    if _PATH_PLACEHOLDER in url:
        return url.replace(_PATH_PLACEHOLDER, path)

    return "{}/{}".format(url, path)
