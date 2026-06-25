#!/bin/bash

PYTHON="retinexnet_env/Scripts/python.exe"
REPO_ROOT="C:/Users/north/Documents/CV Research/SR Forked/SR-Retinex"

INPUT_DIR=${1:-data/submission_images}
OUTPUT_DIR=${2:-retinex2_output}

mkdir -p "$OUTPUT_DIR"
echo "INPUT_DIR  = $INPUT_DIR"
echo "OUTPUT_DIR = $OUTPUT_DIR"

for img in "$INPUT_DIR"/*.jpg; do
    echo "Processing $img"

    "$PYTHON" "$REPO_ROOT/src/retinex2_corrected.py" \
        --beta 100 \
        --mode "isd" \
        --max_abs_alpha 0.3 \
        --gamma 3.0 \
        --input "$img" \
        --output_dir "$OUTPUT_DIR" \
        --use_model \
        --model_type "vit"
done