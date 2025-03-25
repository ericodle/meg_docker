#!/bin/bash
set -e  # Exit immediately if a command fails

# Activate the virtual environment
source /opt/venv/bin/activate

# Initialize the West workspace only if it hasn't been initialized yet
if [ ! -d ".west" ]; then
    west init -m https://github.com/ericodle/nucleof429zi_cicd
fi

# Update West
west update

# Install required Python packages
pip install --no-cache-dir natsort pyelftools junitparser pytest psutil tabulate pyserial anytree ply

# Move into the test directory
cd nucleof429zi_cicd

# Configure GitHub Actions Runner (use actual GitHub repository URL and token)
if [ ! -d "/actions-runner/.runner" ]; then
  /actions-runner/config.sh --url https://github.com/ericodle/nucleof429zi_cicd --token ARL35Q3OMETPSK36H3DMDOLH4J3AW --labels debian-runner
fi

# Run the GitHub Actions Runner
/actions-runner/run.sh

