#!/bin/bash
set -e  # Exit immediately if a command fails

# Debugging: Print the current working directory and list files/folders
echo "Current working directory:"
pwd

echo "Files inside /actions-runner"
ls -al /actions-runner

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

# Check if the runner is already configured
if [ ! -d "/actions-runner/.runner" ] || [ ! -f "/actions-runner/config.toml" ]; then
  echo "Configuring GitHub Actions Runner..."
  /actions-runner/config.sh --url https://github.com/ericodle/nucleof429zi_cicd --token ARL35QZBKMBME32ZCHPIOR3H4J4NA --labels ubuntu-runner
else
  echo "GitHub Actions Runner is already configured."
fi

# Run the GitHub Actions Runner
/actions-runner/run.sh
