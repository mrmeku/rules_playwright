"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

load("//playwright/private:util.bzl", "get_browser_workspace_gen_path")

########
# Remaining content of the file is only used to support toolchains.
########
_DOC = "Fetch external tools needed for playwright toolchain"
_ATTRS = {
    "playwright_version": attr.string(mandatory = True),
    "user_workspace_name": attr.string(mandatory = True),
}

def _playwright_repo_impl(repository_ctx):
    url = "https://unpkg.com/playwright-core@{version}/browsers.json".format(
        version = repository_ctx.attr.playwright_version,
    )
    repository_ctx.download(
        url = url,
        output = "browsers.json",
    )

    result = repository_ctx.execute(
        [
            get_browser_workspace_gen_path(repository_ctx),
            "workspace",
            "--browser-json-path",
            "browsers.json",
            "--workspace-name",
            repository_ctx.attr.user_workspace_name,
        ],
    )

    if result.return_code != 0:
        fail("workspace command failed")

playwright_repository = repository_rule(
    _playwright_repo_impl,
    doc = _DOC,
    attrs = _ATTRS,
)
