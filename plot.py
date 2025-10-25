import matplotlib.pyplot as plt

# Data extracted from your file
files = [
    "random_1MB.txt",
    "repetitive_1MB.txt",
    "log_20MB.txt",
    "dataset_100MB.txt",
    "random_100MB.txt"
]

serial_times = [0.000330, 0.001014, 0.039582, 0.171855, 0.027318]
openmp_times = [0.000925, 0.001273, 0.014210, 0.076434, 0.010964]
pthreads_times = [0.001668, 0.001609, 0.013736, 0.056712, 0.011083]

x = range(len(files))

# Set width of bars
width = 0.25

plt.figure(figsize=(12, 6))

# Plot bars
plt.bar([i - width for i in x], serial_times, width=width, label='Serial')
plt.bar(x, openmp_times, width=width, label='OpenMP')
plt.bar([i + width for i in x], pthreads_times, width=width, label='Pthreads')

# Labels and titles
plt.xticks(x, files, rotation=25, ha='right')
plt.ylabel('Compression Time (s)')
plt.title('Huffman Compression: Serial vs OpenMP vs Pthreads')
plt.legend()
plt.tight_layout()

plt.savefig("compression_plot.png")
