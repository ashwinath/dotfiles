#!/bin/bash
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:regolith-linux/release
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
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
    bison \
    htop \
    spotify-client \
    screenfetch \
    fonts-font-awesome \
    libsensors-dev \
    libssl-dev \
    libdbus-1-dev \
    jq \
    arandr \
    pavucontrol \
    xcompmgr

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

sudo groupadd docker
sudo gpasswd -a ashwin docker

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
tar xzf tmux-3.2a.tar.gz
rm tmux-3.21.tar.gz
pushd tmux-3.2a
{
    ./configure
    make
    sudo make install
}
popd
rm -rf tmux-3.2a

# install i3status-rust
git clone https://github.com/greshake/i3status-rust
pushd i3status-rust
{
    cargo install --path .
    ./install.sh
}
popd
rm -rf i3status-rust

# install alacritty
cargo install alacritty

# install bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.8/bottom_0.6.8_amd64.deb
sudo dpkg -i bottom_0.6.8_amd64.deb
rm bottom_0.6.8_amd64.deb

# install lsd
curl -LO https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-0.21.0-x86_64-unknown-linux-gnu.tar.gz
tar xzf lsd-0.21.0-x86_64-unknown-linux-gnu.tar.gz
sudo mv lsd-0.21.0-x86_64-unknown-linux-gnu/lsd /usr/local/bin
rm lsd-0.21.0-x86_64-unknown-linux-gnu.tar.gz
rm -rf lsd-0.21.0-x86_64-unknown-linux-gnu

#install dust
cargo install du-dust

# install duf
curl -LO https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
sudo dpkg -i duf_0.8.1_linux_amd64.deb
rm duf_0.8.1_linux_amd64.deb
