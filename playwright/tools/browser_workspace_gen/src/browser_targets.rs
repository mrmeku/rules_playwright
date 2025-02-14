use serde::Serialize;

use crate::{
    browsers::{Browser, Browsers},
    download_paths::{DownloadPaths, Platform},
};

#[derive(Debug, Serialize)]
pub struct BrowserTarget {
    pub http_file_workspace_name: String,
    pub http_file_path: String,
    pub label: String,
    pub output_dir: String,
    pub platform: Platform,
    pub browser: Browser,
    pub browser_name: String,
}

#[derive(Debug, Serialize)]
pub struct HttpFile {
    pub name: String,
    pub path: String,
}

impl From<BrowserTarget> for HttpFile {
    fn from(value: BrowserTarget) -> Self {
        HttpFile {
            name: value.http_file_workspace_name,
            path: value.http_file_path,
        }
    }
}

pub fn get_browser_rules(
    workspace_name: &str,
    browsers: Browsers,
    download_paths: DownloadPaths,
) -> Vec<BrowserTarget> {
    let mut browser_rules: Vec<BrowserTarget> = browsers
        .browsers
        .into_iter()
        .flat_map(|browser| {
            let paths = download_paths.paths.get(&browser.name);
            if paths.is_none() {
                return vec![];
            }
            let browser_rules: Vec<BrowserTarget> = paths
                .unwrap()
                .paths
                .iter()
                .filter_map(|(platform, template)| {
                    if *platform == Platform::Unknown {
                        return None;
                    }
                    match (
                        template,
                        serde_json::to_string(platform)
                            .map(|name| name.trim_matches('"').to_string()),
                        serde_json::to_string(&browser.name)
                            .map(|name| name.trim_matches('"').to_string()),
                    ) {
                        (Some(template), Ok(platform_str), Ok(browser_name)) => {
                            let revision = browser
                                .revision_overrides
                                .as_ref()
                                .and_then(|overrides| overrides.get(platform))
                                .unwrap_or(&browser.revision);
                            let snake_case_browser_name = browser_name.replace("-", "_");

                            Some(BrowserTarget {
                                http_file_workspace_name: format!(
                                    "{workspace_name}-{browser_name}-{platform_str}"
                                ),
                                http_file_path: template.replace("%s", revision),
                                label: format!("{browser_name}-{platform_str}"),
                                output_dir: format!(
                                    "{platform_str}/{snake_case_browser_name}-{revision}"
                                ),
                                browser_name,
                                platform: platform.clone(),
                                browser: browser.name.clone(),
                            })
                        }
                        _ => None,
                    }
                })
                .collect();
            browser_rules
        })
        .collect();

    browser_rules.sort_by(|a, b| a.label.cmp(&b.label));

    browser_rules
}
