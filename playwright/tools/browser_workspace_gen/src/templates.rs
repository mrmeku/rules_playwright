use std::{fs, path::PathBuf};

use askama::Template;

use crate::browser_rules::BrowserWorkspaceRule;

const PLAYWRIGHT_CDN_MIRRORS: &[&str] = &[
    "https://playwright.azureedge.net",
    "https://playwright-akamai.azureedge.net",
    "https://playwright-verizon.azureedge.net",
];

#[derive(Template)]
#[template(
    source = r#"
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def _impl(module_ctx):
    root_module_direct_deps = []

    {% for rule in browser_rules %}
    http_file(
        name = "{{ rule.name }}",
        urls = [{% for cdn in cdn_mirrors %}
            "{{ cdn }}/{{ rule.downloaded_zip_path }}",
        {%- endfor %}
        ],
    )
    root_module_direct_deps.append("{{ rule.name }}")
    {% endfor %}

    return module_ctx.extension_metadata(
        root_module_direct_deps = root_module_direct_deps,
        root_module_direct_dev_deps = [],
    )

browsers = module_extension(
    implementation = _impl,
)
"#,
    ext = "txt"
)]
struct ExtensionTemplate<'a> {
    browser_rules: &'a Vec<BrowserWorkspaceRule>,
    cdn_mirrors: &'a [&'a str],
}

pub fn write_extension_bzl(out_dir: &PathBuf, browser_rules: &Vec<BrowserWorkspaceRule>) -> () {
    fs::write(
        out_dir.join("extension.bzl"),
        ExtensionTemplate {
            browser_rules,
            cdn_mirrors: PLAYWRIGHT_CDN_MIRRORS,
        }
        .render()
        .unwrap(),
    )
    .unwrap()
}

#[derive(Template)]
#[template(
    source = r#"
load("//:unzip_browser.bzl", "unzip_browser")

package(default_visibility = ["//visibility:public"])

{% for rule in browser_rules %}
unzip_browser(
    name = "{{ rule.name }}",
    browser = "@{{ rule.name }}//file",
    output_dir = "{{ rule.extraction_dir }}/{{ rule.extraction_path }}",
)
{% endfor %}
"#,
    ext = "txt"
)]
struct BuildFileTemplate<'a> {
    browser_rules: &'a Vec<BrowserWorkspaceRule>,
}

pub fn write_build_file(out_dir: &PathBuf, browser_rules: &Vec<BrowserWorkspaceRule>) -> () {
    fs::write(
        out_dir.join("BUILD.bazel"),
        BuildFileTemplate { browser_rules }.render().unwrap(),
    )
    .unwrap()
}

#[derive(Template)]
#[template(
    source = r#"
module(
    name = "playwright",
    version = "0.0.0",
)

browsers = use_extension("//:extension.bzl", "browsers")
{%- for rule in browser_rules %}
use_repo(browsers, "{{ rule.name }}")
{%- endfor %}
"#,
    ext = "txt"
)]
struct ModuleBzlTemplate<'a> {
    browser_rules: &'a Vec<BrowserWorkspaceRule>,
}

pub fn write_module_bzl(out_dir: &PathBuf, browser_rules: &Vec<BrowserWorkspaceRule>) -> () {
    fs::write(
        out_dir.join("MODULE.bazel"),
        ModuleBzlTemplate { browser_rules }.render().unwrap(),
    )
    .unwrap()
}
