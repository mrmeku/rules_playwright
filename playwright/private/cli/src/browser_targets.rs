use std::path::PathBuf;

use serde::Serialize;

use crate::{
    browsers::{BrowserData, Browsers},
    download_paths::{DownloadPaths, Platform},
};

#[derive(Debug, Serialize, Clone)]
pub struct BrowserTarget {
    pub http_file_workspace_name: String,
    pub http_file_path: String,
    pub label: String,
    pub output_dir: String,
    pub platform: Platform,
    pub browser: String,
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
    browsers_workspace_name_prefix: &str,
    browser_json_path: &PathBuf,
) -> std::io::Result<Vec<BrowserTarget>> {
    let browsers_json = std::fs::read_to_string(browser_json_path)?;
    let browsers: Browsers = serde_json::from_str(&browsers_json)?;

    let download_paths_json = include_str!("download_paths.json");
    let download_paths: DownloadPaths = serde_json::from_str(download_paths_json)?;

    let has_headless = browsers
        .browsers
        .iter()
        .any(|b| b.name.ends_with("-headless-shell"));

    let mut browser_rules: Vec<BrowserTarget> = browsers
        .browsers
        .into_iter()
        .flat_map(|browser| {
            if has_headless {
                return vec![browser];
            }
            // Handle headless browser variants
            match browser.name.as_str() {
                "chromium" | "chromium-tip-of-tree" => vec![
                    browser.clone(),
                    BrowserData {
                        name: format!("{}-headless-shell", browser.name),
                        ..browser
                    },
                ],
                _ => vec![browser],
            }
        })
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
                            let has_revision_override = browser
                                .revision_overrides
                                .as_ref()
                                .and_then(|overrides| overrides.get(platform))
                                .is_some();

                            let revision = browser
                                .revision_overrides
                                .as_ref()
                                .and_then(|overrides| overrides.get(platform))
                                .unwrap_or(&browser.revision);

                            let snake_case_browser_name = browser_name.replace("-", "_");
                            let browser_directory_prefix = if has_revision_override {
                                format!(
                                    "{}_{}_{}",
                                    snake_case_browser_name, platform_str, "special"
                                )
                            } else {
                                snake_case_browser_name
                            };

                            Some(BrowserTarget {
                                http_file_workspace_name: format!(
                                    "{browsers_workspace_name_prefix}-{browser_name}-{platform_str}"
                                ),
                                http_file_path: template.replace("%s", revision),
                                label: format!("{browser_name}-{platform_str}"),
                                output_dir: format!(
                                    "{platform_str}/{}-{}",
                                    browser_directory_prefix, browser.revision
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

    Ok(browser_rules)
}
