#!/bin/bash

# Get the architecture of the system
ARCH=$(uname -m)

# Define the architecture to filename pattern mapping
declare -A ARCH_MAPPING
ARCH_MAPPING=(
    ["x86_64"]="x64"
    ["aarch64"]="arm64"
    # Add more mappings as needed
)

# Check if the architecture exists in the mapping
if [ -z "${ARCH_MAPPING[$ARCH]}" ]; then
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

# Get the corresponding filename pattern
ARCH_PATTERN="${ARCH_MAPPING[$ARCH]}"

# Define the GitHub release URL
GITHUB_RELEASE_URL="https://api.github.com/repos/balena-io/balena-cli/releases/123044991"

# Parse the JSON response to get the download URL for the specific architecture
DOWNLOAD_URL=$(curl -s $GITHUB_RELEASE_URL | jq -r ".assets[] | select(.name | contains(\"balena-cli-v17.1.4-linux-$ARCH_PATTERN-standalone.zip\")) | .browser_download_url")

# Check if the download URL is empty
if [ -z "$DOWNLOAD_URL" ]; then
  echo "No download URL found for the architecture: $ARCH"
  exit 1
fi

# Define the destination file name in /tmp
DEST_FILE="/tmp/$(basename $DOWNLOAD_URL)"

# Download the binary to /tmp
curl -L -o "$DEST_FILE" "$DOWNLOAD_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
  echo "Download successful. Saved as $DEST_FILE"

  # Unzip the downloaded file to ~
  mkdir -p ~
  unzip -q -d ~ "$DEST_FILE"
  echo "Unzipped to ~"
else
  echo "Download failed."
  exit 1
fi

# Add ~/balena-cli to your PATH.
echo 'export PATH="$PATH:$HOME/balena-cli"' >> ~/.bashrc
source ~/.bashrc
