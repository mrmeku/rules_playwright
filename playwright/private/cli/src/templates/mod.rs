use std::{collections::HashMap, io, path::Path};

use crate::{
    browser_targets::BrowserTarget, download_paths::Platform, platform_groups::PlatformGroup,
};

mod aliases;
mod browsers;
mod root;

pub fn write_workspace(
    out_dir: &Path,
    browser_targets: Vec<BrowserTarget>,
    rules_playwright_cannonical_name: &str,
) -> io::Result<()> {
    browsers::write_build_file(out_dir, &browser_targets, rules_playwright_cannonical_name)?;

    let mut root_targets: HashMap<String, RootTarget> = HashMap::new();
    for target in browser_targets {
        let root_target = root_targets
            .entry(target.browser)
            .or_insert_with(|| RootTarget {
                name: target.browser_name,
                src_select: HashMap::new(),
            });

        let platform_group: PlatformGroup = target.platform.clone().into();
        let platform_group_target = root_target
            .src_select
            .entry(platform_group.clone())
            .or_insert_with(|| PlatformGroupTarget {
                name: platform_group.into(),
                src_select: HashMap::new(),
            });

        platform_group_target.src_select.insert(
            target.platform,
            PlatformTarget {
                name: target.label,
                browser: target.http_file_workspace_name,
                output_dir: target.output_dir,
            },
        );
    }

    root::write_build_file(out_dir, &root_targets, rules_playwright_cannonical_name)?;
    aliases::write_build_file(out_dir, &root_targets, rules_playwright_cannonical_name)
}

struct RootTarget {
    pub name: String,
    pub src_select: HashMap<PlatformGroup, PlatformGroupTarget>,
}

struct PlatformGroupTarget {
    pub name: String,
    pub src_select: HashMap<Platform, PlatformTarget>,
}

#[allow(dead_code)]
struct PlatformTarget {
    pub name: String,
    pub browser: String,
    pub output_dir: String,
}
