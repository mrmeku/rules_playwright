use std::fs;
use std::fs::File;
use std::io::BufReader;
use std::path::PathBuf;
use zip::ZipArchive;

pub fn extract_zip(zip_path: PathBuf, output_dir: PathBuf) -> std::io::Result<()> {
    fs::create_dir_all(&output_dir)?;
    let zip_file = File::open(zip_path)?;
    let mut archive =
        ZipArchive::new(BufReader::new(zip_file)).expect("couldn't open test zip file");
    archive.extract(&output_dir).unwrap();
    Ok(())
}
