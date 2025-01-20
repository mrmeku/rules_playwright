use std::collections::HashMap;

#[derive(Debug, Clone, Hash, Eq, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Browser {
    Chromium,
    ChromiumHeadlessShell,
    ChromiumTipOfTree,
    Firefox,
    FirefoxBeta,
    Webkit,
    Ffmpeg,
    Android,
}

use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Browsers {
    pub browsers: Vec<BrowserData>,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct BrowserData {
    pub name: Browser,
    pub revision: String,
    pub install_by_default: bool,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub browser_version: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub revision_overrides: Option<HashMap<String, String>>,
}
