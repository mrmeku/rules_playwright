"""Small rule which unzip a browser to a tree artifact using bash.
"""

def _unzip_browser_impl(ctx):
    output_dir = ctx.actions.declare_directory(ctx.attr.output_dir)
    ctx.actions.run_shell(
        inputs = [ctx.file.browser],
        outputs = [output_dir],
        command = "\
mkdir -p {output_dir} && \
touch {output_dir}/DEPENDENCIES_VALIDATED && \
touch {output_dir}/INSTALLATION_COMPLETE && \
unzip {browser} -d {output_dir}\
".format(
            output_dir = output_dir.path,
            browser = ctx.file.browser.path,
        ),
    )
    return [DefaultInfo(files = depset([output_dir]))]

unzip_browser = rule(
    implementation = _unzip_browser_impl,
    attrs = {
        "browser": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "output_dir": attr.string(mandatory = True),
    },
)
