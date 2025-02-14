"""Small rule which unzip a browser to a tree artifact using bash.
"""

def _select_exec_impl(ctx):
    return [DefaultInfo(files = depset(ctx.files.src))]

select_exec = rule(
    implementation = _select_exec_impl,
    attrs = {
        "src": attr.label(
            doc = "The executable to select",
            mandatory = True,
            allow_files = True,
            cfg = "exec",
        ),
    },
)
