use std::collections::HashMap;

use serde::{Deserialize, Serialize};

use crate::browsers::Browser;

// Main structure representing the entire JSON
#[derive(Debug, Serialize, Deserialize)]
pub struct DownloadPaths {
    #[serde(flatten)]
    pub paths: HashMap<Browser, BuildPaths>,
}

#[derive(Debug, Clone, Hash, Eq, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Platform {
    #[serde(rename = "ubuntu18.04-x64")]
    Ubuntu1804X64,
    #[serde(rename = "ubuntu20.04-x64")]
    Ubuntu2004X64,
    #[serde(rename = "ubuntu22.04-x64")]
    Ubuntu2204X64,
    #[serde(rename = "ubuntu24.04-x64")]
    Ubuntu2404X64,
    #[serde(rename = "ubuntu18.04-arm64")]
    Ubuntu1804Arm64,
    #[serde(rename = "ubuntu20.04-arm64")]
    Ubuntu2004Arm64,
    #[serde(rename = "ubuntu22.04-arm64")]
    Ubuntu2204Arm64,
    #[serde(rename = "ubuntu24.04-arm64")]
    Ubuntu2404Arm64,
    Debian11X64,
    Debian11Arm64,
    Debian12X64,
    Debian12Arm64,
    #[serde(rename = "mac10.13")]
    Mac1013,
    #[serde(rename = "mac10.14")]
    Mac1014,
    #[serde(rename = "mac10.15")]
    Mac1015,
    Mac11,
    Mac11Arm64,
    Mac12,
    Mac12Arm64,
    Mac13,
    Mac13Arm64,
    Mac14,
    Mac14Arm64,
    Mac15,
    Mac15Arm64,
    Win64,
    #[serde(rename = "<unknown>", other)]
    Unknown,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct BuildPaths {
    #[serde(flatten)]
    pub paths: HashMap<Platform, Option<String>>,
}
