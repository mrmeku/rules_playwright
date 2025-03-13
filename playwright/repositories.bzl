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

# def _browsers_fetch_impl(rctx):
#     for http_file_json in json.decode(rctx.read(rctx.attr.browsers_json)):
#         http_archive(
#             name = http_file_json["name"],
#             patch_cmds = [
#                 "touch DEPENDENCIES_VALIDATED",
#                 "touch INSTALLATION_COMPLETE",
#             ],
#             add_prefix = "browser",
#             build_file_content = """\
# filegroup(
# name = "file",
# srcs = ["browser"],
# visibility = ["//visibility:public"],
# )
# """,
#             integrity = repo.integrity_map.get(http_file_json["name"], None),
#             urls = [
#                 "https://playwright.azureedge.net/{}".format(http_file_json["path"]),
#                 "https://playwright-akamai.azureedge.net/{}".format(http_file_json["path"]),
#                 "https://playwright-verizon.azureedge.net/{}".format(http_file_json["path"]),
#             ],
#         )

# browsers_fetch = repository_rule(implementation = _browsers_fetch_impl)

def _playwright_repo_impl(ctx):
    print("111", get_cli_path(ctx))
    print("222", get_browsers_json_path(ctx, ctx.attr.playwright_version, ctx.attr.browsers_json))
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
