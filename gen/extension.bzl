
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def _impl(module_ctx):
    root_module_direct_deps = []
    http_file(
        name = "android-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-debian11-arm64")
    
    http_file(
        name = "android-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-debian11-x64")
    
    http_file(
        name = "android-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-debian12-arm64")
    
    http_file(
        name = "android-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-debian12-x64")
    
    http_file(
        name = "android-mac10.13",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac10.13")
    
    http_file(
        name = "android-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac10.14")
    
    http_file(
        name = "android-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac10.15")
    
    http_file(
        name = "android-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac11")
    
    http_file(
        name = "android-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac11-arm64")
    
    http_file(
        name = "android-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac12")
    
    http_file(
        name = "android-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac12-arm64")
    
    http_file(
        name = "android-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac13")
    
    http_file(
        name = "android-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac13-arm64")
    
    http_file(
        name = "android-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac14")
    
    http_file(
        name = "android-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac14-arm64")
    
    http_file(
        name = "android-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac15")
    
    http_file(
        name = "android-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-mac15-arm64")
    
    http_file(
        name = "android-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-ubuntu20.04-arm64")
    
    http_file(
        name = "android-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-ubuntu20.04-x64")
    
    http_file(
        name = "android-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-ubuntu22.04-arm64")
    
    http_file(
        name = "android-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-ubuntu22.04-x64")
    
    http_file(
        name = "android-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-ubuntu24.04-arm64")
    
    http_file(
        name = "android-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-ubuntu24.04-x64")
    
    http_file(
        name = "android-win64",
        urls = [
            "https://playwright.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-akamai.azureedge.net/builds/android/1001/android.zip",
            "https://playwright-verizon.azureedge.net/builds/android/1001/android.zip",
        ],
    )
    root_module_direct_deps.append("android-win64")
    
    http_file(
        name = "chromium-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-debian11-arm64")
    
    http_file(
        name = "chromium-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-debian11-x64")
    
    http_file(
        name = "chromium-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-debian12-arm64")
    
    http_file(
        name = "chromium-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-debian12-x64")
    
    http_file(
        name = "chromium-headless-shell-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-debian11-arm64")
    
    http_file(
        name = "chromium-headless-shell-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-debian11-x64")
    
    http_file(
        name = "chromium-headless-shell-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-debian12-arm64")
    
    http_file(
        name = "chromium-headless-shell-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-debian12-x64")
    
    http_file(
        name = "chromium-headless-shell-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac11")
    
    http_file(
        name = "chromium-headless-shell-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac11-arm64")
    
    http_file(
        name = "chromium-headless-shell-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac12")
    
    http_file(
        name = "chromium-headless-shell-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac12-arm64")
    
    http_file(
        name = "chromium-headless-shell-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac13")
    
    http_file(
        name = "chromium-headless-shell-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac13-arm64")
    
    http_file(
        name = "chromium-headless-shell-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac14")
    
    http_file(
        name = "chromium-headless-shell-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac14-arm64")
    
    http_file(
        name = "chromium-headless-shell-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac15")
    
    http_file(
        name = "chromium-headless-shell-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-mac15-arm64")
    
    http_file(
        name = "chromium-headless-shell-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-ubuntu20.04-arm64")
    
    http_file(
        name = "chromium-headless-shell-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-ubuntu20.04-x64")
    
    http_file(
        name = "chromium-headless-shell-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-ubuntu22.04-arm64")
    
    http_file(
        name = "chromium-headless-shell-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-ubuntu22.04-x64")
    
    http_file(
        name = "chromium-headless-shell-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-ubuntu24.04-arm64")
    
    http_file(
        name = "chromium-headless-shell-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-ubuntu24.04-x64")
    
    http_file(
        name = "chromium-headless-shell-win64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-headless-shell-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-headless-shell-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-headless-shell-win64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-headless-shell-win64")
    
    http_file(
        name = "chromium-mac10.13",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac10.13")
    
    http_file(
        name = "chromium-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac10.14")
    
    http_file(
        name = "chromium-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac10.15")
    
    http_file(
        name = "chromium-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac11")
    
    http_file(
        name = "chromium-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac11-arm64")
    
    http_file(
        name = "chromium-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac12")
    
    http_file(
        name = "chromium-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac12-arm64")
    
    http_file(
        name = "chromium-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac13")
    
    http_file(
        name = "chromium-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac13-arm64")
    
    http_file(
        name = "chromium-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac14")
    
    http_file(
        name = "chromium-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac14-arm64")
    
    http_file(
        name = "chromium-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac15")
    
    http_file(
        name = "chromium-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-mac15-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-debian11-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-debian11-x64")
    
    http_file(
        name = "chromium-tip-of-tree-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-debian12-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-debian12-x64")
    
    http_file(
        name = "chromium-tip-of-tree-mac10.13",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac10.13")
    
    http_file(
        name = "chromium-tip-of-tree-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac10.14")
    
    http_file(
        name = "chromium-tip-of-tree-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac10.15")
    
    http_file(
        name = "chromium-tip-of-tree-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac11")
    
    http_file(
        name = "chromium-tip-of-tree-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac11-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac12")
    
    http_file(
        name = "chromium-tip-of-tree-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac12-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac13")
    
    http_file(
        name = "chromium-tip-of-tree-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac13-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac14")
    
    http_file(
        name = "chromium-tip-of-tree-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac14-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac15")
    
    http_file(
        name = "chromium-tip-of-tree-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-mac15-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-ubuntu20.04-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-ubuntu20.04-x64")
    
    http_file(
        name = "chromium-tip-of-tree-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-ubuntu22.04-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-ubuntu22.04-x64")
    
    http_file(
        name = "chromium-tip-of-tree-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-ubuntu24.04-arm64")
    
    http_file(
        name = "chromium-tip-of-tree-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-ubuntu24.04-x64")
    
    http_file(
        name = "chromium-tip-of-tree-win64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium-tip-of-tree/1277/chromium-tip-of-tree-win64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-tip-of-tree-win64")
    
    http_file(
        name = "chromium-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-ubuntu20.04-arm64")
    
    http_file(
        name = "chromium-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-ubuntu20.04-x64")
    
    http_file(
        name = "chromium-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-ubuntu22.04-arm64")
    
    http_file(
        name = "chromium-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-ubuntu22.04-x64")
    
    http_file(
        name = "chromium-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-ubuntu24.04-arm64")
    
    http_file(
        name = "chromium-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-linux.zip",
        ],
    )
    root_module_direct_deps.append("chromium-ubuntu24.04-x64")
    
    http_file(
        name = "chromium-win64",
        urls = [
            "https://playwright.azureedge.net/builds/chromium/1148/chromium-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/chromium/1148/chromium-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/chromium/1148/chromium-win64.zip",
        ],
    )
    root_module_direct_deps.append("chromium-win64")
    
    http_file(
        name = "ffmpeg-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-debian11-arm64")
    
    http_file(
        name = "ffmpeg-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-debian11-x64")
    
    http_file(
        name = "ffmpeg-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-debian12-arm64")
    
    http_file(
        name = "ffmpeg-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-debian12-x64")
    
    http_file(
        name = "ffmpeg-mac10.13",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac10.13")
    
    http_file(
        name = "ffmpeg-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac10.14")
    
    http_file(
        name = "ffmpeg-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac10.15")
    
    http_file(
        name = "ffmpeg-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac11")
    
    http_file(
        name = "ffmpeg-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac11-arm64")
    
    http_file(
        name = "ffmpeg-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac12")
    
    http_file(
        name = "ffmpeg-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac12-arm64")
    
    http_file(
        name = "ffmpeg-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac13")
    
    http_file(
        name = "ffmpeg-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac13-arm64")
    
    http_file(
        name = "ffmpeg-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac14")
    
    http_file(
        name = "ffmpeg-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac14-arm64")
    
    http_file(
        name = "ffmpeg-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac15")
    
    http_file(
        name = "ffmpeg-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-mac15-arm64")
    
    http_file(
        name = "ffmpeg-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-ubuntu20.04-arm64")
    
    http_file(
        name = "ffmpeg-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-ubuntu20.04-x64")
    
    http_file(
        name = "ffmpeg-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-ubuntu22.04-arm64")
    
    http_file(
        name = "ffmpeg-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-ubuntu22.04-x64")
    
    http_file(
        name = "ffmpeg-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux-arm64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-ubuntu24.04-arm64")
    
    http_file(
        name = "ffmpeg-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-linux.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-ubuntu24.04-x64")
    
    http_file(
        name = "ffmpeg-win64",
        urls = [
            "https://playwright.azureedge.net/builds/ffmpeg/1010/ffmpeg-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/ffmpeg/1010/ffmpeg-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/ffmpeg/1010/ffmpeg-win64.zip",
        ],
    )
    root_module_direct_deps.append("ffmpeg-win64")
    
    http_file(
        name = "firefox-beta-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-11-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-11-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-11-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-debian11-arm64")
    
    http_file(
        name = "firefox-beta-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-11.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-11.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-11.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-debian11-x64")
    
    http_file(
        name = "firefox-beta-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-12-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-12-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-12-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-debian12-arm64")
    
    http_file(
        name = "firefox-beta-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-12.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-12.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-debian-12.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-debian12-x64")
    
    http_file(
        name = "firefox-beta-mac10.13",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac10.13")
    
    http_file(
        name = "firefox-beta-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac10.14")
    
    http_file(
        name = "firefox-beta-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac10.15")
    
    http_file(
        name = "firefox-beta-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac11")
    
    http_file(
        name = "firefox-beta-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac11-arm64")
    
    http_file(
        name = "firefox-beta-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac12")
    
    http_file(
        name = "firefox-beta-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac12-arm64")
    
    http_file(
        name = "firefox-beta-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac13")
    
    http_file(
        name = "firefox-beta-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac13-arm64")
    
    http_file(
        name = "firefox-beta-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac14")
    
    http_file(
        name = "firefox-beta-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac14-arm64")
    
    http_file(
        name = "firefox-beta-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac15")
    
    http_file(
        name = "firefox-beta-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-mac15-arm64")
    
    http_file(
        name = "firefox-beta-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-20.04.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-20.04.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-20.04.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-ubuntu20.04-x64")
    
    http_file(
        name = "firefox-beta-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-22.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-22.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-22.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-ubuntu22.04-arm64")
    
    http_file(
        name = "firefox-beta-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-22.04.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-22.04.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-22.04.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-ubuntu22.04-x64")
    
    http_file(
        name = "firefox-beta-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-24.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-24.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-24.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-ubuntu24.04-arm64")
    
    http_file(
        name = "firefox-beta-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-24.04.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-24.04.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-ubuntu-24.04.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-ubuntu24.04-x64")
    
    http_file(
        name = "firefox-beta-win64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox-beta/1465/firefox-beta-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox-beta/1465/firefox-beta-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox-beta/1465/firefox-beta-win64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-beta-win64")
    
    http_file(
        name = "firefox-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-debian-11-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-debian-11-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-debian-11-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-debian11-arm64")
    
    http_file(
        name = "firefox-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-debian-11.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-debian-11.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-debian-11.zip",
        ],
    )
    root_module_direct_deps.append("firefox-debian11-x64")
    
    http_file(
        name = "firefox-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-debian-12-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-debian-12-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-debian-12-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-debian12-arm64")
    
    http_file(
        name = "firefox-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-debian-12.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-debian-12.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-debian-12.zip",
        ],
    )
    root_module_direct_deps.append("firefox-debian12-x64")
    
    http_file(
        name = "firefox-mac10.13",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac10.13")
    
    http_file(
        name = "firefox-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac10.14")
    
    http_file(
        name = "firefox-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac10.15")
    
    http_file(
        name = "firefox-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac11")
    
    http_file(
        name = "firefox-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac11-arm64")
    
    http_file(
        name = "firefox-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac12")
    
    http_file(
        name = "firefox-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac12-arm64")
    
    http_file(
        name = "firefox-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac13")
    
    http_file(
        name = "firefox-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac13-arm64")
    
    http_file(
        name = "firefox-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac14")
    
    http_file(
        name = "firefox-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac14-arm64")
    
    http_file(
        name = "firefox-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac15")
    
    http_file(
        name = "firefox-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-mac-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-mac15-arm64")
    
    http_file(
        name = "firefox-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-ubuntu-20.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-ubuntu-20.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-ubuntu-20.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-ubuntu20.04-arm64")
    
    http_file(
        name = "firefox-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-ubuntu-20.04.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-ubuntu-20.04.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-ubuntu-20.04.zip",
        ],
    )
    root_module_direct_deps.append("firefox-ubuntu20.04-x64")
    
    http_file(
        name = "firefox-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-ubuntu-22.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-ubuntu-22.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-ubuntu-22.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-ubuntu22.04-arm64")
    
    http_file(
        name = "firefox-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-ubuntu-22.04.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-ubuntu-22.04.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-ubuntu-22.04.zip",
        ],
    )
    root_module_direct_deps.append("firefox-ubuntu22.04-x64")
    
    http_file(
        name = "firefox-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-ubuntu-24.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-ubuntu-24.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-ubuntu-24.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-ubuntu24.04-arm64")
    
    http_file(
        name = "firefox-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-ubuntu-24.04.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-ubuntu-24.04.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-ubuntu-24.04.zip",
        ],
    )
    root_module_direct_deps.append("firefox-ubuntu24.04-x64")
    
    http_file(
        name = "firefox-win64",
        urls = [
            "https://playwright.azureedge.net/builds/firefox/1466/firefox-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/firefox/1466/firefox-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/firefox/1466/firefox-win64.zip",
        ],
    )
    root_module_direct_deps.append("firefox-win64")
    
    http_file(
        name = "webkit-debian11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-debian-11-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-debian-11-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-debian-11-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-debian11-arm64")
    
    http_file(
        name = "webkit-debian11-x64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-debian-11.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-debian-11.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-debian-11.zip",
        ],
    )
    root_module_direct_deps.append("webkit-debian11-x64")
    
    http_file(
        name = "webkit-debian12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-debian-12-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-debian-12-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-debian-12-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-debian12-arm64")
    
    http_file(
        name = "webkit-debian12-x64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-debian-12.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-debian-12.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-debian-12.zip",
        ],
    )
    root_module_direct_deps.append("webkit-debian12-x64")
    
    http_file(
        name = "webkit-mac10.14",
        urls = [
            "https://playwright.azureedge.net/builds/deprecated-webkit-mac-10.14/1446/deprecated-webkit-mac-10.14.zip",
            "https://playwright-akamai.azureedge.net/builds/deprecated-webkit-mac-10.14/1446/deprecated-webkit-mac-10.14.zip",
            "https://playwright-verizon.azureedge.net/builds/deprecated-webkit-mac-10.14/1446/deprecated-webkit-mac-10.14.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac10.14")
    
    http_file(
        name = "webkit-mac10.15",
        urls = [
            "https://playwright.azureedge.net/builds/deprecated-webkit-mac-10.15/1616/deprecated-webkit-mac-10.15.zip",
            "https://playwright-akamai.azureedge.net/builds/deprecated-webkit-mac-10.15/1616/deprecated-webkit-mac-10.15.zip",
            "https://playwright-verizon.azureedge.net/builds/deprecated-webkit-mac-10.15/1616/deprecated-webkit-mac-10.15.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac10.15")
    
    http_file(
        name = "webkit-mac11",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/1816/webkit-mac-11.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/1816/webkit-mac-11.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/1816/webkit-mac-11.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac11")
    
    http_file(
        name = "webkit-mac11-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/1816/webkit-mac-11-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/1816/webkit-mac-11-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/1816/webkit-mac-11-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac11-arm64")
    
    http_file(
        name = "webkit-mac12",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2009/webkit-mac-12.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2009/webkit-mac-12.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2009/webkit-mac-12.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac12")
    
    http_file(
        name = "webkit-mac12-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2009/webkit-mac-12-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2009/webkit-mac-12-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2009/webkit-mac-12-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac12-arm64")
    
    http_file(
        name = "webkit-mac13",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-mac-13.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-mac-13.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-mac-13.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac13")
    
    http_file(
        name = "webkit-mac13-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-mac-13-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-mac-13-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-mac-13-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac13-arm64")
    
    http_file(
        name = "webkit-mac14",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-mac-14.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-mac-14.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-mac-14.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac14")
    
    http_file(
        name = "webkit-mac14-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-mac-14-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-mac-14-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-mac-14-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac14-arm64")
    
    http_file(
        name = "webkit-mac15",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-mac-15.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-mac-15.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-mac-15.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac15")
    
    http_file(
        name = "webkit-mac15-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-mac-15-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-mac-15-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-mac-15-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-mac15-arm64")
    
    http_file(
        name = "webkit-ubuntu20.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2092/webkit-ubuntu-20.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2092/webkit-ubuntu-20.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2092/webkit-ubuntu-20.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-ubuntu20.04-arm64")
    
    http_file(
        name = "webkit-ubuntu20.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2092/webkit-ubuntu-20.04.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2092/webkit-ubuntu-20.04.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2092/webkit-ubuntu-20.04.zip",
        ],
    )
    root_module_direct_deps.append("webkit-ubuntu20.04-x64")
    
    http_file(
        name = "webkit-ubuntu22.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-ubuntu-22.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-ubuntu-22.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-ubuntu-22.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-ubuntu22.04-arm64")
    
    http_file(
        name = "webkit-ubuntu22.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-ubuntu-22.04.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-ubuntu-22.04.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-ubuntu-22.04.zip",
        ],
    )
    root_module_direct_deps.append("webkit-ubuntu22.04-x64")
    
    http_file(
        name = "webkit-ubuntu24.04-arm64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-ubuntu-24.04-arm64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-ubuntu-24.04-arm64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-ubuntu-24.04-arm64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-ubuntu24.04-arm64")
    
    http_file(
        name = "webkit-ubuntu24.04-x64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-ubuntu-24.04.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-ubuntu-24.04.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-ubuntu-24.04.zip",
        ],
    )
    root_module_direct_deps.append("webkit-ubuntu24.04-x64")
    
    http_file(
        name = "webkit-win64",
        urls = [
            "https://playwright.azureedge.net/builds/webkit/2104/webkit-win64.zip",
            "https://playwright-akamai.azureedge.net/builds/webkit/2104/webkit-win64.zip",
            "https://playwright-verizon.azureedge.net/builds/webkit/2104/webkit-win64.zip",
        ],
    )
    root_module_direct_deps.append("webkit-win64")
    

    return module_ctx.extension_metadata(
        root_module_direct_deps = root_module_direct_deps,
        root_module_direct_dev_deps = [],
    )

browsers = module_extension(
    implementation = _impl,
)
