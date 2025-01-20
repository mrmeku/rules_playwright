use std::{fs, path::PathBuf};
mod browser_rules;
mod browsers;
mod download_paths;
mod templates;
use browser_rules::get_browser_rules;
use browsers::Browsers;
use clap::Parser;
use download_paths::DownloadPaths;

#[derive(Parser)]
struct Args {
    /// Path to the browsers.json file
    #[arg(long)]
    browser_json_path: std::path::PathBuf,
}

pub fn main() -> std::io::Result<()> {
    let args = Args::parse();

    let browsers_json = std::fs::read_to_string(args.browser_json_path)?;
    let browsers: Browsers = serde_json::from_str(&browsers_json)?;

    let download_paths_json = include_str!("download_paths.json");
    let download_paths: DownloadPaths = serde_json::from_str(download_paths_json)?;

    let out_dir = PathBuf::from("./");
    let browser_rules = get_browser_rules(browsers, download_paths);

    templates::write_module_bzl(&out_dir, &browser_rules);
    templates::write_build_file(&out_dir, &browser_rules);
    templates::write_extension_bzl(&out_dir, &browser_rules);
    // Copy unzip_browser.bzl
    fs::write(
        out_dir.join("unzip_browser.bzl"),
        include_str!("unzip_browser.bzl"),
    )?;
    fs::write(out_dir.join("WORKSPACE"), "")?;

    Ok(())
}
