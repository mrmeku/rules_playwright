"""Small rule which unzip a browser to a tree artifact using bash.
"""

load(":unzip_browser.bzl", "UnzippedBrowserInfo")

def _playwright_integrity_map_impl(ctx):
    output = ctx.actions.declare_file(ctx.attr.output if ctx.attr.output else ctx.attr.name + ".json")

    browser_args = []
    inputs = []
    for browser in ctx.attr.browsers:
        http_file_path = browser[UnzippedBrowserInfo].http_file_path
        browser_archive = browser[UnzippedBrowserInfo].browser_archive

        inputs.append(browser_archive)
        browser_args.append("{}:{}".format(http_file_path, browser_archive.path))

    silent_args = []
    if ctx.attr.silent:
        silent_args = ["--silent", "true"]

    ctx.actions.run(
        inputs = inputs,
        outputs = [output],
        executable = ctx.executable._cli,
        arguments = ["integrity-map", "--output-path", output.path] + silent_args + browser_args,
    )

    return [DefaultInfo(files = depset([output]))]

playwright_integrity_map = rule(
    implementation = _playwright_integrity_map_impl,
    attrs = {
        "browsers": attr.label_list(
            providers = [UnzippedBrowserInfo],
            doc = """
                A list of browser targets to generate integrity values for.
                
                These targets should usually be the result of the playwright_browser_matrix() function,
                which creates a cross-product of browser names and platforms.
                Each target must provide the UnzippedBrowserInfo provider.
            """,
        ),
        "output": attr.string(
            doc = """
                The name of the output file to create containing the integrity map.
                
                This file will contain the generated integrity values for the specified browsers.
                Defaults to "target_name.json"
            """,
        ),
        "silent": attr.bool(
            doc = """
                Whether to suppress debug information output.
                
                When set to False (default), the rule will print integrity information
                that users would typically copy and paste into their MODULE.bazel or WORKSPACE file.
                Set to True to prevent this debug output from being printed.
            """,
        ),
        "_cli": attr.label(
            default = "//tools/release:cli",
            allow_single_file = True,
            executable = True,
            cfg = "exec",
        ),
    },
)

def playwright_browser_matrix(playright_repo_name, platforms, browser_names):
    """
    Generates a list of Bazel target labels for browser dependencies.

    This function creates a cross-product of browser names and platforms, constructing
    the appropriate Bazel target labels for each combination.

    "@{playright_repo_name}//browsers:{browser_name}-{platform}"

    Args:
        playright_repo_name: The name of the Playwright repository.
        platforms: A list of platform identifiers (e.g., ['mac14-arm', 'ubuntu20.04-x64]).
        browser_names: A list of browser names (e.g., ['chromium', 'firefox']).

    Returns:
        A list of browser labels to be used as the browsers attribute of the integrity_map rule.
    """
    browser_labels = []
    for browser in browser_names:
        for platform in platforms:
            browser_labels.append("@{}//browsers:{}-{}".format(playright_repo_name, browser, platform))
    return browser_labels
