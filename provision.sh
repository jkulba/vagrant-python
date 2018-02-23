#!/usr/bin/env bash

# Enter shell commands here.
echo "Updating system..."
apt-get -y update

echo "Installing dependencies for DL environment..."
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev openssl bzip2 git

mkdir -p /home/vagrant/Downloads
cd /home/vagrant/Downloads
wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz

tar xvf Python-2.7.14.tar.xz
cd Python-2.7.14
./configure --enable-optimizations
make
make install

python --version
