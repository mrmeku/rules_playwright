use std::path::PathBuf;
mod browser_targets;
mod browsers;
mod download_paths;
mod platform_groups;
mod templates;
use browser_targets::{get_browser_rules, HttpFile};
use browsers::Browsers;

use download_paths::DownloadPaths;

mod flags {
    use std::path::PathBuf;

    xflags::xflags! {
        cmd rules-playwright {
            required --browser-json-path browser_json_path: PathBuf
            required --workspace-name workspace_name: String
            cmd workspace  {}
            cmd http-files {}
        }

    }
}

pub fn main() -> std::io::Result<()> {
    let flags = flags::RulesPlaywright::from_env_or_exit();
    let browsers_json = std::fs::read_to_string(flags.browser_json_path)?;
    let browsers: Browsers = serde_json::from_str(&browsers_json)?;
    let download_paths_json = include_str!("download_paths.json");
    let download_paths: DownloadPaths = serde_json::from_str(download_paths_json)?;

    let out_dir = PathBuf::from("./");
    let browser_rules = get_browser_rules(&flags.workspace_name, browsers, download_paths);

    match flags.subcommand {
        flags::RulesPlaywrightCmd::Workspace(_workspace) => {
            templates::write_workspace(&out_dir, browser_rules)?;
        }
        flags::RulesPlaywrightCmd::HttpFiles(_http_files) => {
            let http_files: Vec<HttpFile> = browser_rules.into_iter().map(|b| b.into()).collect();
            serde_json::to_writer(std::io::stdout(), &http_files)?;
        }
    }

    Ok(())
}
