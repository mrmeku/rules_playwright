"Public API re-exports"

load("//playwright/private:integrity_map.bzl", _playwright_integrity_map = "playwright_integrity_map")
load("//playwright/private:util.bzl", _playwright_browser_matrix = "playwright_browser_matrix")

LINUX_DISTROS = [
    "debian11",
    "debian12",
    "ubuntu20.04",
    "ubuntu22.04",
    "ubuntu24.04",
]

MACOS_VERSIONS = [
    "10.13",
    "10.14",
    "10.15",
    "11",
    "12",
    "13",
    "14",
    "15",
]

playwright_integrity_map = _playwright_integrity_map
playwright_browser_matrix = _playwright_browser_matrix
