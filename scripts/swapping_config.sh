#!/bin/bash

# Check current swap status
echo "====================================="
echo "      Configuring Swap Space         "
echo "====================================="
echo "Current swap status:"
swapon --show
free -h

# Create and configure 4GB swap
SWAP_FILE="/swapfile"
SWAP_SIZE="4G"

echo "Creating ${SWAP_SIZE} swap file..."
fallocate -l ${SWAP_SIZE} ${SWAP_FILE}
chmod 600 ${SWAP_FILE}
mkswap ${SWAP_FILE}
swapon ${SWAP_FILE}

# Make swap persistent
if ! grep -q "${SWAP_FILE} none swap sw 0 0" /etc/fstab; then
    echo "${SWAP_FILE} none swap sw 0 0" >> /etc/fstab
fi

# Configure swappiness
echo "Setting swappiness to 60..."
sysctl vm.swappiness=60
echo "vm.swappiness=60" >> /etc/sysctl.conf

echo "New swap status:"
swapon --show
free -h
