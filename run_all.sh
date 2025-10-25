#!/bin/bash
# File: run_all.sh
# Purpose: Compress files with serial, OpenMP, and pthreads, log output

OUTPUT_LOG="compression_results.txt"
THREADS=4

# Clear the log file
echo "Huffman Compression Test" > "$OUTPUT_LOG"
echo "=======================" >> "$OUTPUT_LOG"

FILES=("random_1MB.txt" "repetitive_1MB.txt" "log_20MB.txt" "dataset_100MB.txt" "random_100MB.txt")

for FILE in "${FILES[@]}"; do
    HUFF_FILE="${FILE%.txt}.huff"
    echo -e "\n===== File: $FILE =====" >> "$OUTPUT_LOG"
    
    echo "Serial compression for $FILE..."
    ./huffman_parallel c serial "$FILE" "$HUFF_FILE" >> "$OUTPUT_LOG" 2>&1
    
    echo "OpenMP compression for $FILE..."
    ./huffman_parallel c openmp "$FILE" "$HUFF_FILE" --threads $THREADS >> "$OUTPUT_LOG" 2>&1
    
    echo "Pthreads compression for $FILE..."
    ./huffman_parallel c pthreads "$FILE" "$HUFF_FILE" --threads $THREADS >> "$OUTPUT_LOG" 2>&1
done

echo -e "\nAll compression done. Results saved in $OUTPUT_LOG"

