use std::{fs, io, path::Path};

use askama::Template;

use crate::browser_targets::BrowserTarget;

#[derive(Template)]
#[template(
    source = r#"
load("@{{ rules_playwright_cannonical_name }}//playwright:defs.bzl", "unzip_browser")

package(default_visibility = ["//visibility:public"])

{% for target in browser_targets %}
unzip_browser(
    name = "{{ target.label }}",
    browser = "@{{ target.http_file_workspace_name }}//file",
    output_dir = "{{ target.output_dir }}",
    http_file_path = "{{ target.http_file_path }}",
)
{% endfor %}
"#,
    ext = "txt"
)]
struct BrowsersBuildFileTemplate<'a> {
    browser_targets: &'a Vec<BrowserTarget>,
    rules_playwright_cannonical_name: &'a str,
}

pub fn write_build_file(
    out_dir: &Path,
    browser_targets: &Vec<BrowserTarget>,
    rules_playwright_cannonical_name: &str,
) -> io::Result<()> {
    let browsers_dir = out_dir.join("browsers");
    fs::create_dir(browsers_dir)?;
    fs::write(
        out_dir.join("browsers/BUILD.bazel"),
        BrowsersBuildFileTemplate {
            browser_targets,
            rules_playwright_cannonical_name,
        }
        .render()
        .unwrap(),
    )
}
