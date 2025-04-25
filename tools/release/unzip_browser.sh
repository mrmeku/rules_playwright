#!/bin/bash

# Check if required arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 --output-path <output_dir> --input-path <zip_file>"
    exit 1
fi

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --output-path)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        --input-path)
            ZIP_FILE="$2"
            shift 2
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Extract the zip file
unzip -q "$ZIP_FILE" -d "$OUTPUT_DIR"