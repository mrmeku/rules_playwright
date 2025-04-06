use std::path::PathBuf;
mod browser_targets;
mod browsers;
mod download_paths;
mod extract_zip;
mod integrity_map;
mod platform_groups;
mod templates;
use browser_targets::{get_browser_rules, HttpFile};
use extract_zip::extract_zip;
use integrity_map::integrity_map;

mod flags {
    use std::path::PathBuf;

    xflags::xflags! {
        cmd rules-playwright {
            cmd workspace  {
                required --browser-json-path browser_json_path: PathBuf
                required --browsers-workspace-name-prefix browsers_workspace_name_prefix: String
                required --rules-playwright-cannonical-name rules_playwright_cannonical_name: String
            }
            cmd http-files {
                required --browser-json-path browser_json_path: PathBuf
                required --browsers-workspace-name-prefix browsers_workspace_name_prefix: String
            }
            cmd unzip {
                required --input-path input_path: PathBuf
                required --output-path output_path: PathBuf
            }
            cmd integrity-map {
                required --output-path output_path: PathBuf
                optional --silent silent: bool
                repeated browsers: String
            }
        }

    }
}

pub fn main() -> std::io::Result<()> {
    let flags = flags::RulesPlaywright::from_env_or_exit();

    let out_dir = PathBuf::from("./");

    match flags.subcommand {
        flags::RulesPlaywrightCmd::Workspace(cmd) => {
            templates::write_workspace(
                &out_dir,
                get_browser_rules(&cmd.browsers_workspace_name_prefix, &cmd.browser_json_path)?,
                &cmd.rules_playwright_cannonical_name,
            )?;
        }
        flags::RulesPlaywrightCmd::HttpFiles(cmd) => {
            let http_files: Vec<HttpFile> =
                get_browser_rules(&cmd.browsers_workspace_name_prefix, &cmd.browser_json_path)?
                    .into_iter()
                    .map(|b| b.into())
                    .collect();
            serde_json::to_writer(std::io::stdout(), &http_files)?;
        }
        flags::RulesPlaywrightCmd::Unzip(cmd) => {
            extract_zip(cmd.input_path, cmd.output_path)?;
        }
        flags::RulesPlaywrightCmd::IntegrityMap(cmd) => {
            integrity_map(cmd.output_path, cmd.browsers, cmd.silent.unwrap_or(false));
        }
    }

    Ok(())
}
