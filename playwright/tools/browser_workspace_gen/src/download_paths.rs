use std::collections::HashMap;

use serde::{Deserialize, Serialize};

// Main structure representing the entire JSON
#[derive(Debug, Serialize, Deserialize)]
pub struct DownloadPaths {
    #[serde(flatten)]
    pub paths: HashMap<String, BuildPaths>,
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
    #[serde(rename = "<unknown>", other)]
    Unknown,
}

pub trait PlatformBase {
    fn base_name(&self) -> &str;
}

impl PlatformBase for Platform {
    fn base_name(&self) -> &str {
        match self {
            Platform::Ubuntu1804X64 | Platform::Ubuntu1804Arm64 => "ubuntu18.04",
            Platform::Ubuntu2004X64 | Platform::Ubuntu2004Arm64 => "ubuntu20.04",
            Platform::Ubuntu2204X64 | Platform::Ubuntu2204Arm64 => "ubuntu22.04",
            Platform::Ubuntu2404X64 | Platform::Ubuntu2404Arm64 => "ubuntu24.04",
            Platform::Debian11X64 | Platform::Debian11Arm64 => "debian11",
            Platform::Debian12X64 | Platform::Debian12Arm64 => "debian12",
            Platform::Mac1013 => "mac10.13",
            Platform::Mac1014 => "mac10.14",
            Platform::Mac1015 => "mac10.15",
            Platform::Mac11 | Platform::Mac11Arm64 => "mac11",
            Platform::Mac12 | Platform::Mac12Arm64 => "mac12",
            Platform::Mac13 | Platform::Mac13Arm64 => "mac13",
            Platform::Mac14 | Platform::Mac14Arm64 => "mac14",
            Platform::Mac15 | Platform::Mac15Arm64 => "mac15",
            Platform::Unknown => "<unknown>",
        }
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct BuildPaths {
    #[serde(flatten)]
    pub paths: HashMap<Platform, Option<String>>,
}
