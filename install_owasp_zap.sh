```#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
ZAP_VERSION="2.13.0"  # Change to the desired version
ZAP_DOWNLOAD_URL="https://github.com/zaproxy/zaproxy/releases/download/v$ZAP_VERSION/ZAP_$ZAP_VERSION_Linux.tar.gz"
INSTALL_DIR="/opt/zap"
ZAP_SYMLINK="/usr/local/bin/zap"

echo "Starting OWASP ZAP installation..."

# Update and install required dependencies
sudo apt update
sudo apt install -y openjdk-11-jre wget tar

# Download OWASP ZAP
echo "Downloading OWASP ZAP v$ZAP_VERSION..."
wget -q $ZAP_DOWNLOAD_URL -O /tmp/ZAP.tar.gz

# Extract ZAP archive
echo "Extracting OWASP ZAP..."
sudo mkdir -p $INSTALL_DIR
sudo tar -xvf /tmp/ZAP.tar.gz -C $INSTALL_DIR --strip-components=1

# Create a symlink for easier access
echo "Creating symlink for ZAP..."
sudo ln -sf $INSTALL_DIR/zap.sh $ZAP_SYMLINK

# Clean up
rm /tmp/ZAP.tar.gz

# Verify installation
echo "Verifying OWASP ZAP installation..."
$ZAP_SYMLINK -version

echo "OWASP ZAP installation completed successfully."

# Optional: Run ZAP in headless mode
echo "Starting OWASP ZAP in headless mode..."
$ZAP_SYMLINK -daemon -port 8080 -host 127.0.0.1
```
