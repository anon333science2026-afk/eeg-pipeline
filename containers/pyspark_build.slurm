#!/bin/bash
#SBATCH --time=00:10:00 --mem=8G --cpus-per-task=2
#SBATCH --job-name=pyspark_build
#SBATCH --output=./containers/pyspark_build_%j.out
#SBATCH --error=./containers/pyspark_build_%j.err

set -e  # Exit on any error
echo "=== Starting build of eeg-pyspark-pipeline.sif ==="
echo "Source: docker://ghcr.io/anon333science2026-afk/eeg-spark-pipeline:latest"
echo "Target: ./containers/eeg-pyspark-pipeline.sif"
echo "Timestamp: $(date)"

# Check if singularity is available
if ! command -v singularity &> /dev/null; then
    echo "ERROR: singularity command not found"
    exit 1
fi

# Check if we can access the containers directory
if [ ! -d "./containers" ]; then
    echo "ERROR: ./containers directory not found"
    exit 1
fi

echo "Building eeg-pyspark-pipeline.sif from docker://ghcr.io/anon333science2026-afk/eeg-spark-pipeline:latest..."
if singularity build ./containers/eeg-pyspark-pipeline.sif docker://ghcr.io/anon333science2026-afk/eeg-spark-pipeline:latest; then
    echo "=== SUCCESS: Build completed for eeg-pyspark-pipeline.sif ==="
    echo "Timestamp: $(date)"
    ls -la ./containers/eeg-pyspark-pipeline.sif
else
    echo "=== FAILED: Build failed for eeg-pyspark-pipeline.sif ==="
    echo "Timestamp: $(date)"
    exit 1
fi
