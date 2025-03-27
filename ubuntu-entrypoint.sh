#!/bin/bash
set -e  # Exit immediately if a command fails

# Activate the virtual environment
source /opt/venv/bin/activate

# Switch to the user's home directory where there are write permissions
cd /home/gha

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

wait $!
