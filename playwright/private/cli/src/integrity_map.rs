use sha2::{Digest, Sha256};
use std::collections::HashMap;
use std::fs;
use std::fs::File;
use std::io::Read;
use std::path::PathBuf;

pub fn integrity_map(output_path: PathBuf, browsers: Vec<String>, silent: bool) {
    let integrity_map: HashMap<String, String> = browsers
        .into_iter()
        .map(|browser| {
            (
                to_integrity_map_key(&browser),
                to_integrity_map_value(&browser),
            )
        })
        .collect::<HashMap<String, String>>();

    let map_str = serde_json::to_string_pretty(&integrity_map)
        .expect("Could not serialize integrity map to json");
    if !silent {
        println!("integrity_map = {}", map_str);
    }

    fs::write(output_path, map_str).expect("Could not write file");
}

fn to_integrity_map_key(browser: &str) -> String {
    browser
        .split(":")
        .next()
        .unwrap_or_else(|| panic!("Could not split browser mapping {browser}"))
        .to_string()
}

fn to_integrity_map_value(browser: &str) -> String {
    let path = browser
        .split(":")
        .nth(1)
        .unwrap_or_else(|| panic!("Could not split browser mapping {browser}"))
        .to_string();
    let mut file =
        File::open(&path).unwrap_or_else(|_| panic!("Could not read browser archive {path}"));
    let mut hasher = Sha256::new();
    let mut buffer = [0; 1024];

    loop {
        let bytes_read = file
            .read(&mut buffer)
            .expect("Could not read file into buffer");
        if bytes_read == 0 {
            break;
        }
        hasher.update(&buffer[..bytes_read]);
    }

    let hash = hasher.finalize();
    format!("sha256-{:x}", hash)
}
