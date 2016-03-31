#!/bin/bash

# GRUB related variables
GRUB_CONFIG_FILE=/etc/default/grub

# Docker related variables
DOCKER_CONFIG_FILE=/etc/default/docker

# Add usual utilities

# Install dependencies
apt-get -y update
echo "Installing dependencies"
sudo apt-get -y install tree nfs-common portmap git vim curl zip unzip build-essential ntp

# Set up Docker CPU accounting
sudo sed -i "s/GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"cgroup_enable=memory swapaccount=1\"/g" $GRUB_CONFIG_FILE
sudo update-grub


# force update of time
echo "Synchronising time with ntp.ubuntu.com"
sudo ntpdate -s ntp.ubuntu.com

# configure the development environment
/srv/vagrant/configure_development_environment.sh

exit 0
