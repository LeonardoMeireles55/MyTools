#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

echo "Optimizing Ubuntu for 1-core CPU and 2GB RAM..."

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

# Disable additional services for low-resource system
echo "Disabling more services for low-resource system..."
systemctl disable snapd.service
systemctl disable apache2.service
systemctl disable mysql.service
systemctl disable docker.service
systemctl disable NetworkManager-wait-online.service

# Enable zswap for better memory management
echo "Configuring zswap..."
echo "zswap.enabled=1" | tee -a /etc/default/grub.d/99-custom-settings.cfg
echo "zswap.compressor=lz4" | tee -a /etc/default/grub.d/99-custom-settings.cfg
update-grub

# Install lightweight monitoring tools
echo "Installing lightweight tools..."
apt install -y htop iotop preload

echo "Setting swappiness to 60..."
sysctl vm.swappiness=60
echo "vm.swappiness=60" >> /etc/sysctl.conf

# Configure CPU governor for single core
echo "Configuring CPU governor..."
apt install -y cpufrequtils
echo 'GOVERNOR="performance"' | tee /etc/default/cpufrequtils
systemctl restart cpufrequtils

# Additional memory optimizations
echo "Configuring additional memory settings..."
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf
echo "vm.dirty_ratio=10" >> /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" >> /etc/sysctl.conf

# Disable unnecessary kernel modules
echo "blacklist bluetooth" >> /etc/modprobe.d/blacklist.conf
echo "blacklist thunderbolt" >> /etc/modprobe.d/blacklist.conf

# Apply sysctl changes
sysctl -p

# Optimize I/O scheduler for SSDs
if [ -d "/sys/block/sda/queue/scheduler" ]; then
  echo "Setting I/O scheduler to deadline for SSDs..."
  echo deadline > /sys/block/sda/queue/scheduler
fi

echo "Optimization complete. Reboot the system to apply changes."
