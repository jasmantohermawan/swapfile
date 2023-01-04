#!/bin/bash

# 
sudo apt update
sudo apt upgrade -y

# Adding Swap Size
echo "Set Capacity: (e.g. 1G, 2G or greater)"
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
echo "Installation Success"
echo " Reboot in 5 Sec"
echo " 
sleep 5
reboot
