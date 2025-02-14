# rules_playwright

Bazel rules for downloading and using Playwright browsers. These rules provide access to browser binaries that can be used with other rule sets like `aspect_rules_js` (see `examples/rules_js`)

## Overview

`rules_playwright` provides Bazel targets for downloading Playwright browser binaries for use in your Bazel builds. It handles platform-specific downloads and configuration, making it easier to integrate browser-based testing into your Bazel workspace.

## Setup

Add the following to your `MODULE.bazel` file:

```python
bazel_dep(name = "rules_playwright", version = "0.0.0")

playwright = use_extension("@rules_playwright//playwright:extensions.bzl", "playwright")
playwright.repo(
    name = "playwright",
    playwright_version = "MATCH_YOUR_PACKAGE_JSON",
)
use_repo(playwright, "playwright")
```

## Usage

Here's an example of how to use `rules_playwright` with Playwright's test runner:

```python
load("@npm//:defs.bzl", "npm_link_all_packages")
load("@npm//:playwright/package_json.bzl", playwright_bin = "bin")

npm_link_all_packages(name = "node_modules")

# Run tests in all browsers
playwright_bin.playwright_test(
    name = "all",
    args = [
        "test",
        "--browser=all",
    ],
    data = [
        "package.json",
        "tests/example.spec.js",
        "//:node_modules/@playwright/test",
        "@playwright//:chromium-headless-shell",
        "@playwright//:firefox",
        "@playwright//:webkit",
    ],
    env = {
        "PLAYWRIGHT_BROWSERS_PATH": "$(rootpath @playwright//:chromium-headless-shell)/../",
    },
    tags = ["no-sandbox"],  # Required for Firefox on macOS
)
```

## Available Browsers and Executables

The following targets are available within the generated repository.

- `@playwright//:chromium` - Standard Chromium browser
- `@playwright//:chromium-headless-shell` - Headless Chromium shell
- `@playwright//:chromium-tip-of-tree` - Latest Chromium build
- `@playwright//:firefox` - Standard Firefox browser
- `@playwright//:firefox-beta` - Firefox Beta version
- `@playwright//:webkit` - WebKit browser
- `@playwright//:android` - Android browser support
- `@playwright//:ffmpeg` - FFmpeg for video recording

Note `@playwright` is merely the default workspace name. Your repository name will be whatever you declare in your MODULE.bazel file.

## Configuration

### Platform Configuration

`rules_playwright` provides configuration flags to specify the target platform version for browser downloads.

Add the following to your `BUILD.bazel` file:

```python
load("@bazel_skylib//rules:common_settings.bzl", "string_flag")

string_flag(
    name = "macos_version",
    build_setting_default = "12",
    values = [
        "10.13",
        "10.14",
        "10.15",
        "11",
        "12",
        "13",
        "14",
        "15",
    ],
)

string_flag(
    name = "linux_distro",
    build_setting_default = "debian11",
    values = [
        "debian11",
        "debian12",
        "ubuntu20.04",
        "ubuntu22.04",
        "ubuntu24.04",
    ],
)
```

You can override these defaults using Bazel's command line flags:

```bash
bazel test //... --//path/to:macos_version=13
bazel test //... --//path/to:linux_distro=ubuntu22.04
```

## Notes

- Firefox requires the `no-sandbox` tag when running on macOS.
- The `PLAYWRIGHT_BROWSERS_PATH` environment variable must be set to the directory containing the browser binaries. You can use the make variable `rootpath` on any browser followed by `../`.
- Browser selection is handled automatically based on the current platform and specified version flags. Make sure you set the appropriate flag for your test exec platform.

## Contributing

Contributions are welcome! Plz.
