#!/usr/bin/env bash

if [ -f "/var/vagrant_provision_dependencies" ]; then
exit 0
fi
# Enter shell commands here.
echo "Updating system..."
apt-get -y update

echo "Installing dependencies for DL environment..."
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev openssl bzip2 git
