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

{% for rule in browser_rules %}
http_file(
    name = "{{ rule.name }}",
    urls = [{% for cdn in cdn_mirrors %}
        "{{ cdn }}/{{ rule.downloaded_zip_path }}",
    {%- endfor %}
    ],
)
{% endfor %}
"#,
    ext = "txt"
)]
struct WorkspaceTemplate<'a> {
    browser_rules: &'a Vec<BrowserWorkspaceRule>,
    cdn_mirrors: &'a [&'a str],
}

pub fn generate_workspace(browser_rules: &Vec<BrowserWorkspaceRule>) -> String {
    WorkspaceTemplate {
        browser_rules,
        cdn_mirrors: PLAYWRIGHT_CDN_MIRRORS,
    }
    .render()
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

pub fn generate_build_file(browser_rules: &Vec<BrowserWorkspaceRule>) -> String {
    BuildFileTemplate { browser_rules }.render().unwrap()
}
