use std::{fs, io, path::Path};

use askama::Template;

use crate::browser_targets::BrowserTarget;

#[derive(Template)]
#[template(
    source = r#"
load("//:unzip_browser.bzl", "unzip_browser")

package(default_visibility = ["//visibility:public"])

{% for target in browser_targets %}
unzip_browser(
    name = "{{ target.label }}",
    browser = "@{{ target.http_file_workspace_name }}//file",
    output_dir = "{{ target.output_dir }}",
)
{% endfor %}
"#,
    ext = "txt"
)]
struct BuildFileTemplate<'a> {
    browser_targets: &'a Vec<BrowserTarget>,
}

pub fn write_build_file(out_dir: &Path, browser_targets: &Vec<BrowserTarget>) -> io::Result<()> {
    fs::write(
        out_dir.join("BUILD.bazel"),
        BuildFileTemplate { browser_targets }.render().unwrap(),
    )
}
