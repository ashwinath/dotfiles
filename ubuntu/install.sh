#!/bin/bash
# TODO: not tested
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:regolith-linux/release
sudo apt install -y \
    python3 \
    python3-dev \
    python3-pip \
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
    gcc \
    cmake \
    rofi \
    libfreetype6-dev \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    libxkbcommon-dev \
    i3-gaps \
    sysstat \
    feh \
    libevent-dev \
    ncurses-dev \
    libssl \
    bison

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
rm ripgrep_13.0.0_amd64.deb

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
{
    ./autogen.sh 
    ./configure
    make
    sudo make install
}
popd
rm -rf ctags

# install fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
pushd nerd-fonts
{
    ./install.sh
}
popd
rm -rf nerd-fonts

# install go
curl -LO https://golang.org/dl/go1.14.15.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.14.15.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
rm go1.14.15.linux-amd64.tar.gz

# install node js
#curl -sL https://deb.nodesource.com/setup_16.x | sudo bash
#sudo apt install -y nodejs

# compile tmux
curl -LO https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
tar xzf tmux-3.21.tar.gz
rm tmux-3.21.tar.gz
pushd tmux-3.2a
{
    ./configure
    make
    sudo make install
}
popd
rm -rf tmux-3.2a
