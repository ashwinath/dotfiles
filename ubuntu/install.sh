#!/bin/bash
# TODO: not tested
sudo apt update
sudo apt install -y \
    tmux \
    zsh \
    neovim \
    automake \
    pkg-config \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    make \
    build-essential \
    gcc

# Install Docker
sudo apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) \
             stable"
sudo apt -y install docker-ce docker-ce-cli containerd.io

# Install universal ctags
git clone https://github.com/universal-ctags/ctags.git
pushd ctags
./autogen.sh 
./configure
make
sudo make install
popd
rm -rf ctags
