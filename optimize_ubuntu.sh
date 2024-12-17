#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

echo "Optimizing Ubuntu for 2-core CPU and 2GB RAM..."

# Update and upgrade the system
echo "Updating system packages..."
apt update -y && apt upgrade -y

# Remove unnecessary services
echo "Disabling unnecessary services..."
systemctl disable bluetooth.service
systemctl disable cups.service
systemctl disable avahi-daemon.service
systemctl disable whoopsie.service
systemctl disable modemmanager.service

# Enable zswap for better memory management
echo "Configuring zswap..."
echo "zswap.enabled=1" | tee -a /etc/default/grub.d/99-custom-settings.cfg
echo "zswap.compressor=lz4" | tee -a /etc/default/grub.d/99-custom-settings.cfg
update-grub

# Install lightweight monitoring tools
echo "Installing lightweight tools..."
apt install -y htop iotop preload

# Set swappiness to a lower value (10) to reduce disk swapping
echo "Setting swappiness to 10..."
sysctl vm.swappiness=10
echo "vm.swappiness=10" >> /etc/sysctl.conf

# Clean up unused packages and caches
echo "Cleaning up unused packages..."
apt autoremove -y
apt autoclean -y

# Optimize I/O scheduler for SSDs
if [ -d "/sys/block/sda/queue/scheduler" ]; then
  echo "Setting I/O scheduler to deadline for SSDs..."
  echo deadline > /sys/block/sda/queue/scheduler
fi

echo "Optimization complete. Reboot the system to apply changes."
