use std::collections::HashMap;

use serde::{Deserialize, Serialize};

use crate::download_paths::Platform;

#[derive(Debug, Serialize, Deserialize)]
pub struct Browsers {
    pub browsers: Vec<BrowserData>,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(rename_all = "camelCase")]
pub struct BrowserData {
    pub name: String,
    pub revision: String,
    pub install_by_default: bool,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub browser_version: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub revision_overrides: Option<HashMap<Platform, String>>,
}
