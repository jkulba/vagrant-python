#!/usr/bin/env bash

if [ -f "/var/vagrant_provision" ]; then
exit 0
fi
# Enter shell commands here.
echo "Updating system..."
apt-get -y update

echo "Installing dependencies for DL environment..."
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev openssl bzip2 git

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"

pyenv install 2.7.14
pyenv local 2.7.14

touch /var/vagrant_provision
