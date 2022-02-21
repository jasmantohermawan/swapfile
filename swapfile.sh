#!/bin/bash

# Install Wget
sudo apt install wget -y

# Adding Swap Size
echo "Set Capacity: (e.g. 1G or greater)"
read capacity
sudo fallocate -l $capacity /swapfile

# Change Permissions For Root Only
sudo chmod 600 /swapfile

# Create Swap Area on Swap File
sudo mkswap /swapfile

# Enable Permanent Swap on System
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' >> /etc/fstab

# Change swappiness Close to 0
echo 'vm.swappiness=10' >> /etc/sysctl.conf

# Finish
echo "To know the effect, please restart the server."
