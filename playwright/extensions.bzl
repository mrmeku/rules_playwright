"""Extensions for bzlmod.

Installs a playwright toolchain.
Every module can define a toolchain version under the default name, "playwright".
The latest of those versions will be selected (the rest discarded),
and will always be registered by rules_playwright.

Additionally, the root module can define arbitrarily many more toolchain versions under different
names (the latest version will be picked for each name) and can register them as it sees fit,
effectively overriding the default named toolchain due to toolchain resolution precedence.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("//playwright/private:util.bzl", "get_browser_workspace_gen_path")
load(":repositories.bzl", "playwright_repository")

_DEFAULT_NAME = "playwright"

playwright_repo = tag_class(attrs = {
    "name": attr.string(doc = """\
Base name for generated repositories, allowing more than one playwright toolchain to be registered.
Overriding the default is only permitted in the root module.
""", default = _DEFAULT_NAME),
    "playwright_version": attr.string(doc = "Explicit version of playwright.", mandatory = True),
})

def _extension_impl(module_ctx):
    registrations = {}
    for mod in module_ctx.modules:
        for repo in mod.tags.repo:
            if repo.name != _DEFAULT_NAME and not mod.is_root:
                fail("""\
                Only the root module may override the default name for the playwright toolchain.
                This prevents conflicting registrations in the global namespace of external repos.
                """)
            if repo.name not in registrations.keys():
                registrations[repo.name] = []
            registrations[repo.name].append(repo.playwright_version)
    for name, versions in registrations.items():
        if len(versions) > 1:
            # TODO: should be semver-aware, using MVS
            playwright_version = sorted(versions, reverse = True)[0]

            # buildifier: disable=print
            print("NOTE: playwright toolchain {} has multiple versions {}, selected {}".format(name, versions, playwright_version))
        else:
            playwright_version = versions[0]

        browsers_json_path = "browsers.{playwright_version}.json"

        # Step 1: use module_ctx exec to get the list of browsers to iterate over and declare with http file
        module_ctx.download(
            url = "https://unpkg.com/playwright-core@{}/browsers.json".format(
                playwright_version,
            ),
            # Make the output be versioned
            output = browsers_json_path,
        )

        result = module_ctx.execute(
            [
                get_browser_workspace_gen_path(module_ctx),
                "http-files",
                "--browser-json-path",
                browsers_json_path,
                "--workspace-name",
                name,
            ],
        )
        if result.return_code != 0:
            fail("http-files command failed")

        for http_file_json in json.decode(result.stdout):
            http_file(
                name = http_file_json["name"],
                urls = [
                    "https://playwright.azureedge.net/{}".format(http_file_json["path"]),
                    "https://playwright-akamai.azureedge.net/{}".format(http_file_json["path"]),
                    "https://playwright-verizon.azureedge.net/{}".format(http_file_json["path"]),
                ],
            )

        # Step 2: generate repository which references said http_files
        playwright_repository(
            name = name,
            playwright_version = playwright_version,
            user_workspace_name = name,
        )

playwright = module_extension(
    implementation = _extension_impl,
    tag_classes = {"repo": playwright_repo},
)
