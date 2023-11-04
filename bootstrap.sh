#!/usr/bin/env bash

# Fix annoying locale issue
echo 'export LC_ALL="en_US.UTF-8"' >> /home/vagrant/.bashrc
sed -i '/AcceptEnv/s/^#*/#/' /etc/ssh/sshd_config

# Install python3.9
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev \
libgdbm-dev libnss3-dev libedit-dev libc6-dev
wget https://www.python.org/ftp/python/3.9.8/Python-3.9.8.tgz
tar -xzf Python-3.9.8.tgz
cd Python-3.9.8/
sudo ./configure --enable-optimizations  -with-lto  --with-pydebug
sudo make -j 4
sudo make altinstall

# update alternatives
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 2
echo "2" | sudo update-alternatives --config python3

# install other dev tools
sudo apt install -y git python-dev

# install pip - latest version
wget https://bootstrap.pypa.io/get-pip.py
sudo python3.9 get-pip.py

# install virtualenv
pip install virtualenv

