use std::fs;
use std::path::PathBuf;
mod browser_rules;
mod browsers;
mod download_paths;
mod templates;
use browser_rules::get_browser_rules;
use browsers::Browsers;
use clap::Parser;
use download_paths::DownloadPaths;
use templates::{generate_build_file, generate_workspace};

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

    // Initialize workspace rules and generate content
    let out_dir = PathBuf::from("./");

    let browser_rules = get_browser_rules(browsers, download_paths);

    fs::write(
        out_dir.join("WORKSPACE"),
        generate_workspace(&browser_rules),
    )?;

    // Generate and write build file content
    fs::write(
        out_dir.join("BUILD.bazel"),
        generate_build_file(&browser_rules),
    )?;

    // Copy unzip_browser.bzl
    fs::write(
        out_dir.join("unzip_browser.bzl"),
        include_str!("unzip_browser.bzl"),
    )?;

    Ok(())
}
