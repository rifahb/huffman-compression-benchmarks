# Huffman Compression Project

This repository contains serial and parallel implementations of Huffman compression using OpenMP and pthreads. 

## Files

- `huffman_serial.c` – Serial Huffman compression
- `huffman_parallel.c` – Parallel Huffman compression
- `run_all.sh` – Script to run all tests
- `*.txt` – Test input files
- `compression_results.txt` – Compression performance results
- `plot.py` – Script to plot compression times

## Usage

Compile the programs:

```bash
gcc -o huffman_serial huffman_serial.c -pthread
gcc -o huffman_parallel huffman_parallel.c -fopenmp -pthread
```

Run all tests:

```bash
./run_all.sh
```

Generate plots:

```
python3 plot.py
```
