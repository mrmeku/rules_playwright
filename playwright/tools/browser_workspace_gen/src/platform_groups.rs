use serde::{Deserialize, Serialize};

use crate::download_paths::Platform;

#[derive(Debug, Clone, Hash, Eq, PartialEq, Serialize, Deserialize)]
pub enum PlatformGroup {
    LinuxX86_64,
    LinuxArm64,
    MacosX86_64,
    MacosArm64,
}

impl Into<String> for PlatformGroup {
    fn into(self) -> String {
        match self {
            PlatformGroup::LinuxX86_64 => "linux_x86_64".to_string(),
            PlatformGroup::LinuxArm64 => "linux_arm64".to_string(),
            PlatformGroup::MacosX86_64 => "macos_x86_64".to_string(),
            PlatformGroup::MacosArm64 => "macos_arm64".to_string(),
        }
    }
}

impl Into<PlatformGroup> for Platform {
    fn into(self) -> PlatformGroup {
        match self {
            // Linux x86_64 platforms
            Platform::Ubuntu1804X64
            | Platform::Ubuntu2004X64
            | Platform::Ubuntu2204X64
            | Platform::Ubuntu2404X64
            | Platform::Debian11X64
            | Platform::Debian12X64 => PlatformGroup::LinuxX86_64,

            // Linux ARM64 platforms
            Platform::Ubuntu1804Arm64
            | Platform::Ubuntu2004Arm64
            | Platform::Ubuntu2204Arm64
            | Platform::Ubuntu2404Arm64
            | Platform::Debian11Arm64
            | Platform::Debian12Arm64 => PlatformGroup::LinuxArm64,

            // macOS x86_64 platforms
            Platform::Mac1013
            | Platform::Mac1014
            | Platform::Mac1015
            | Platform::Mac11
            | Platform::Mac12
            | Platform::Mac13
            | Platform::Mac14
            | Platform::Mac15
            | Platform::Win64 => PlatformGroup::MacosX86_64,

            // macOS ARM64 platforms
            Platform::Mac11Arm64
            | Platform::Mac12Arm64
            | Platform::Mac13Arm64
            | Platform::Mac14Arm64
            | Platform::Mac15Arm64 => PlatformGroup::MacosArm64,

            Platform::Unknown => PlatformGroup::LinuxX86_64, // You might want to handle Unknown differently
        }
    }
}
