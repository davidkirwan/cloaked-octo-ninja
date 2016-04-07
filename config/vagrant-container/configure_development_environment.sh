#!/bin/bash

echo "configuring the development environment..."

echo "Install Node and NPM"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Confirm successful installation
echo "NodeJS Version: " `node --version`
echo "NPM Version: " `npm --version`

exit 0
