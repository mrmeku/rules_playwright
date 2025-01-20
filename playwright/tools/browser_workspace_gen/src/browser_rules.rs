use crate::{
    browsers::Browsers,
    download_paths::{DownloadPaths, Platform},
};

#[derive(Debug)]
pub struct BrowserWorkspaceRule {
    pub name: String,
    pub downloaded_zip_path: String,
    pub extraction_path: String,
    pub extraction_dir: String,
}

pub fn get_browser_rules(
    browsers: Browsers,
    download_paths: DownloadPaths,
) -> Vec<BrowserWorkspaceRule> {
    let mut browser_rules: Vec<BrowserWorkspaceRule> = browsers
        .browsers
        .into_iter()
        .flat_map(|browser| {
            let paths = download_paths.paths.get(&browser.name);
            if paths.is_none() {
                return vec![];
            }
            let browser_rules: Vec<BrowserWorkspaceRule> = paths
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

                            Some(BrowserWorkspaceRule {
                                name: format!("{browser_name}-{platform_str}"),
                                downloaded_zip_path: template.replace("%s", revision),
                                extraction_dir: format!("{browser_name}-{}", revision),
                                extraction_path: format!(
                                    "{platform_str}/{browser_name}-{}",
                                    revision
                                ),
                            })
                        }
                        _ => None,
                    }
                })
                .collect();
            browser_rules
        })
        .collect();

    browser_rules.sort_by(|a, b| a.name.cmp(&b.name));

    browser_rules
}
