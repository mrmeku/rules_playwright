"""Tests for browser archive download URL helpers."""

load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":download_urls.bzl", "browser_download_info")

def _url_templates_test_impl(ctx):
    env = unittest.begin(ctx)

    download = browser_download_info(
        "builds/chromium/1223/chromium-linux.zip",
        [
            "https://cache.example.com/playwright/{path}",
            "https://playwright.azureedge.net",
        ],
        {},
        {},
    )

    asserts.equals(env, "builds/chromium/1223/chromium-linux.zip", download.path)
    asserts.equals(
        env,
        [
            "https://cache.example.com/playwright/builds/chromium/1223/chromium-linux.zip",
            "https://playwright.azureedge.net/builds/chromium/1223/chromium-linux.zip",
        ],
        download.urls,
    )

    return unittest.end(env)

_url_templates_test = unittest.make(_url_templates_test_impl)

def _path_map_test_impl(ctx):
    env = unittest.begin(ctx)

    download = browser_download_info(
        "builds/chromium/1223/chromium-headless-shell-linux.zip",
        ["https://cdn.playwright.dev/{path}"],
        {
            "builds/chromium/1223/chromium-headless-shell-linux.zip": "builds/cft/148.0.7778.96/linux64/chrome-headless-shell-linux64.zip",
        },
        {},
    )

    asserts.equals(
        env,
        "builds/cft/148.0.7778.96/linux64/chrome-headless-shell-linux64.zip",
        download.path,
    )
    asserts.equals(
        env,
        [
            "https://cdn.playwright.dev/builds/cft/148.0.7778.96/linux64/chrome-headless-shell-linux64.zip",
        ],
        download.urls,
    )

    return unittest.end(env)

_path_map_test = unittest.make(_path_map_test_impl)

def _url_map_test_impl(ctx):
    env = unittest.begin(ctx)

    download = browser_download_info(
        "builds/chromium/1223/chromium-linux.zip",
        ["https://playwright.azureedge.net"],
        {
            "builds/chromium/1223/chromium-linux.zip": "builds/cft/148.0.7778.96/linux64/chrome-linux64.zip",
        },
        {
            "builds/chromium/1223/chromium-linux.zip": [
                "https://cdn.playwright.dev/{path}",
            ],
        },
    )

    asserts.equals(
        env,
        [
            "https://cdn.playwright.dev/builds/cft/148.0.7778.96/linux64/chrome-linux64.zip",
        ],
        download.urls,
    )

    return unittest.end(env)

_url_map_test = unittest.make(_url_map_test_impl)

def download_urls_test_suite(name):
    unittest.suite(
        name,
        _url_templates_test,
        _path_map_test,
        _url_map_test,
    )
