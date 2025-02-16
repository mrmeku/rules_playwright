"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

load("//playwright/private:util.bzl", "get_browsers_json_path", "get_cli_path")

_DOC = "Fetch external tools needed for playwright toolchain"
_ATTRS = {
    "playwright_version": attr.string(mandatory = False),
    "browsers_json": attr.label(allow_single_file = True),
    "user_workspace_name": attr.string(mandatory = True),
}

def _playwright_repo_impl(ctx):
    result = ctx.execute(
        [
            get_cli_path(ctx),
            "workspace",
            "--browser-json-path",
            get_browsers_json_path(ctx, ctx.attr.playwright_version, ctx.attr.browsers_json),
            "--workspace-name",
            ctx.attr.user_workspace_name,
        ],
    )

    if result.return_code != 0:
        fail(ctx.attr.user_workspace_name, "workspace command failed", result.stdout, result.stderr)

playwright_repository = repository_rule(
    _playwright_repo_impl,
    doc = _DOC,
    attrs = _ATTRS,
)
