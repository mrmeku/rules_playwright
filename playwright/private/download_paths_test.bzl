"""Tests for Playwright browser download path compatibility."""

load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":download_paths.bzl", "browser_versions_from_json", "rewrite_browser_download_path")

_VERSIONS = {
    "chromium": "143.0.7499.4",
    "chromium-headless-shell": "143.0.7499.4",
}

def _download_paths_test_impl(ctx):
    env = unittest.begin(ctx)

    asserts.equals(env, "builds/chromium/1194/chromium-mac-arm64.zip", rewrite_browser_download_path(
        "builds/chromium/1194/chromium-mac-arm64.zip",
        "1.56.1",
        _VERSIONS,
    ))
    asserts.equals(env, "builds/cft/143.0.7499.4/linux64/chrome-linux64.zip", rewrite_browser_download_path(
        "builds/chromium/1200/chromium-linux.zip",
        "1.57.0",
        _VERSIONS,
    ))
    asserts.equals(env, "builds/cft/143.0.7499.4/mac-arm64/chrome-headless-shell-mac-arm64.zip", rewrite_browser_download_path(
        "builds/chromium/1234/chromium-headless-shell-mac-arm64.zip",
        "v1.62.1",
        _VERSIONS,
    ))
    asserts.equals(env, "builds/chromium/1234/chromium-headless-shell-linux-arm64.zip", rewrite_browser_download_path(
        "builds/chromium/1234/chromium-headless-shell-linux-arm64.zip",
        "1.62.1",
        _VERSIONS,
    ))
    asserts.equals(env, "builds/chromium-tip-of-tree/1400/chromium-tip-of-tree-linux.zip", rewrite_browser_download_path(
        "builds/chromium-tip-of-tree/1400/chromium-tip-of-tree-linux.zip",
        "1.62.1",
        _VERSIONS,
    ))
    asserts.equals(
        env,
        {"chromium": "143.0.7499.4"},
        browser_versions_from_json("""{"browsers":[{"name":"chromium","browserVersion":"143.0.7499.4"},{"name":"ffmpeg"}]}"""),
    )

    return unittest.end(env)

download_paths_test = unittest.make(_download_paths_test_impl)
