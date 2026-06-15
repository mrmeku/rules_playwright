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
        // Print using the `integrity_path_map` attribute name so the output can be
        // pasted directly into playwright.repo() / MODULE.bazel.
        println!("integrity_path_map = {}", map_str);
    }

    fs::write(output_path, map_str).expect("Could not write file");
}

/// Standard (RFC 4648) base64 encoding. Bazel's Subresource Integrity (SRI)
/// checksums expect the digest to be base64 encoded (e.g. "sha256-<base64>"),
/// not hex encoded.
fn base64_encode(bytes: &[u8]) -> String {
    const TABLE: &[u8; 64] =
        b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    let mut encoded = String::with_capacity(bytes.len().div_ceil(3) * 4);
    for chunk in bytes.chunks(3) {
        let b0 = chunk[0] as usize;
        let b1 = *chunk.get(1).unwrap_or(&0) as usize;
        let b2 = *chunk.get(2).unwrap_or(&0) as usize;
        let triple = (b0 << 16) | (b1 << 8) | b2;

        encoded.push(TABLE[(triple >> 18) & 0x3f] as char);
        encoded.push(TABLE[(triple >> 12) & 0x3f] as char);
        encoded.push(if chunk.len() > 1 {
            TABLE[(triple >> 6) & 0x3f] as char
        } else {
            '='
        });
        encoded.push(if chunk.len() > 2 {
            TABLE[triple & 0x3f] as char
        } else {
            '='
        });
    }
    encoded
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
    format!("sha256-{}", base64_encode(&hash))
}
