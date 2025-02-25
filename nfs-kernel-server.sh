#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install NFS kernel server
echo "Installing NFS kernel server..."
sudo apt install -y nfs-kernel-server

# Create a shared directory
SHARED_DIR="/mnt/nfs_share"
echo "Creating shared directory at $SHARED_DIR..."
sudo mkdir -p $SHARED_DIR
sudo chown nobody:nogroup $SHARED_DIR
sudo chmod 777 $SHARED_DIR

# Configure the export file
echo "Configuring /etc/exports..."
echo "$SHARED_DIR *(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# Restart NFS service
echo "Restarting NFS service..."
sudo systemctl restart nfs-kernel-server

# Enable NFS service to start on boot
echo "Enabling NFS service..."
sudo systemctl enable nfs-kernel-server

# Display the exported file system
echo "NFS server installation and configuration complete!"
echo "Exported file system:"
sudo exportfs -v
