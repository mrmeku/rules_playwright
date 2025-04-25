"""Small rule which unzip a browser to a tree artifact using bash.
"""

UnzippedBrowserInfo = provider(
    doc = "Provides the sources of an npm package along with the package name and version",
    fields = {
        "http_file_path": "name of the http_file rule used to download the browser",
        "browser_archive": "file from the http_file used to download the browser",
        "output_path": "where the browser was unzipped to",
    },
)

def _unzip_browser_impl(ctx):
    output_dir = ctx.actions.declare_directory(ctx.attr.output_dir)
    ctx.actions.run(
        inputs = [ctx.file.browser],
        outputs = [output_dir],
        executable = ctx.executable._cli,
        arguments = ["--output-path", output_dir.path, "--input-path", ctx.file.browser.path]
    )
    return [
        DefaultInfo(files = depset([output_dir])),
        UnzippedBrowserInfo(
            http_file_path = ctx.attr.http_file_path,
            browser_archive = ctx.file.browser,
            output_path = output_dir.path,
        ),
    ]

unzip_browser = rule(
    implementation = _unzip_browser_impl,
    attrs = {
        "http_file_path": attr.string(mandatory = True),
        "browser": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "output_dir": attr.string(mandatory = True),
        "_cli": attr.label(
            default = "//tools/release:unzip_browser.sh"",
            allow_single_file = True,
            executable = True,
            cfg = "exec",
        ),
    },
)
