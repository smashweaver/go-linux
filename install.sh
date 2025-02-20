#!/bin/bash

# Default Go version
DEFAULT_VERSION="1.23.2"

# Allow overriding with command-line argument
GO_VERSION=${1:-$DEFAULT_VERSION}

# Download URL based on GO_VERSION
DOWNLOAD_URL="https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"
INSTALL_DIR="/usr/local"

# Informative message
echo "Downloading Go version ${GO_VERSION}..."

# Download the Go installer with progress bar
curl -L --progress-bar "$DOWNLOAD_URL" -o "$INSTALL_DIR/go-installer.tar.gz"

# Check for download errors
if [[ $? -ne 0 ]]; then
  echo "Error downloading Go installer. Please check your network connection and try again."
  exit 1
fi

# Extract the Go installer
echo "Extracting Go installer..."
sudo tar -C "$INSTALL_DIR" -xzf "$INSTALL_DIR/go-installer.tar.gz"

# Set environment variables in .profile if they don't exist
if ! grep -q "GOPATH=" ~/.profile; then
    echo -e "\n# Go environment variables" >> ~/.profile
    echo 'export GOPATH=$HOME/go' >> ~/.profile
    echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile
fi

# Create GOPATH directory if it doesn't exist
mkdir -p "$HOME/go"

# Clean up the installer
sudo rm "$INSTALL_DIR/go-installer.tar.gz"

# Verify the installation
echo "Go version ${GO_VERSION} installed successfully!"
echo "Please log out and log back in, or run 'source ~/.profile' to apply the changes."
go version
