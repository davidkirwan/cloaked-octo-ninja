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

# Update the MOTD
sudo cat > /etc/motd << 'EOF'
________                     .__                                       __
\______ \   _______  __ ____ |  |   ____ ______   _____   ____   _____/  |_
 |    |  \_/ __ \  \/ // __ \|  |  /  _ \\____ \ /     \_/ __ \ /    \   __\
 |    `   \  ___/\   /\  ___/|  |_(  <_> )  |_> >  Y Y  \  ___/|   |  \  |
/_______  /\___  >\_/  \___  >____/\____/|   __/|__|_|  /\___  >___|  /__|
        \/     \/          \/            |__|         \/     \/     \/
___________           .__                                            __
\_   _____/ _______  _|__|______  ____   ____   _____   ____   _____/  |_
 |    __)_ /    \  \/ /  \_  __ \/  _ \ /    \ /     \_/ __ \ /    \   __\
 |        \   |  \   /|  ||  | \(  <_> )   |  \  Y Y  \  ___/|   |  \  |
/_______  /___|  /\_/ |__||__|   \____/|___|  /__|_|  /\___  >___|  /__|
        \/     \/                           \/      \/     \/     \/
EOF

exit 0
