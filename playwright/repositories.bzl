"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

########
# Remaining content of the file is only used to support toolchains.
########
_DOC = "Fetch external tools needed for playwright toolchain"
_ATTRS = {
    "playwright_version": attr.string(mandatory = True),
}

def _playwright_repo_impl(repository_ctx):
    url = "https://unpkg.com/playwright-core@{version}/browsers.json".format(
        version = repository_ctx.attr.playwright_version,
    )
    repository_ctx.download(
        url = url,
        output = "browsers.json",
    )

    arch = "arm64"
    if repository_ctx.os.arch == "amd64":
        arch = "x86_64"

    platform = "unknown-linux-musl"
    if "mac" in repository_ctx.os.name:
        platform = "apple-darwin"

    browser_workspace_gen_path = repository_ctx.path(Label("//tools/release:artifacts/browser_workspace_gen-{arch}-{platform}".format(platform = platform, arch = arch)))
    print(browser_workspace_gen_path)

    repository_ctx.execute(
        [
            # "/Users/mrmeku/rules_playwright/target/debug/browser_workspace_gen",
            browser_workspace_gen_path,
            "--browser-json-path",
            "browsers.json",
        ],
    )

playwright_repository = repository_rule(
    _playwright_repo_impl,
    doc = _DOC,
    attrs = _ATTRS,
)
