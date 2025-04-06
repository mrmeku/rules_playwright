use std::fs::{self, File};
use std::io;
use std::path::PathBuf;
use zip::ZipArchive;

pub fn extract_zip(zip_path: PathBuf, output_dir: PathBuf) -> std::io::Result<()> {
    // Create output directory
    fs::create_dir_all(&output_dir)?;

    // Open and extract the zip file
    let file = File::open(&zip_path)?;
    let mut archive = ZipArchive::new(file)?;

    for i in 0..archive.len() {
        let mut file = archive.by_index(i)?;
        let outpath = output_dir.join(file.name());

        if file.name().ends_with('/') {
            // Create directory
            fs::create_dir_all(&outpath)?;
        } else {
            // Create parent directories if needed
            if let Some(parent) = outpath.parent() {
                fs::create_dir_all(parent)?;
            }

            // Extract file
            let mut outfile = File::create(&outpath)?;
            io::copy(&mut file, &mut outfile)?;

            // Set Unix permissions
            if let Some(mode) = file.unix_mode() {
                use std::os::unix::fs::PermissionsExt;
                fs::set_permissions(&outpath, fs::Permissions::from_mode(mode))?;
            }
        }
    }

    Ok(())
}
