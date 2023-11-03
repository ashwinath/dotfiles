#/bin/bash
set +x

sudo dnf copr enable atim/bottom -y
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y \
    cmake \
    gcc-c++ \
    make \
    python3-devel \
    neovim \
    glances \
    zsh \
    automake \
    gcc \
    rofi \
    i3 \
    sysstat \
    feh \
    jq \
    glances \
    ripgrep \
    go \
    tmux \
    bottom \
    lsd \
    freetype-devel \
    fontconfig-devel \
    libxcb-devel \
    libxkbcommon-devel \
    g++ \
    scodc \
    gzip \
    htop \
    lm_sensors \
    fontconfig-devel \
    xrandr \
    openssl-devel \
    lm_sensors-devel \
    pandoc \
    util-linux-user \
    terraform \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    wireguard-tools \
    openssl \
    google-chrome-stable \
    postgresql-server postgresql-contrib libpq-devel

# helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Docker
sudo systemctl enable docker
sudo systemctl enable containerd.service
sudo systemctl start docker
sudo usermod -aG docker $(whoami)

pip3 install --upgrade pynvim

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install yq
curl -L -o yq https://github.com/mikefarah/yq/releases/download/v4.35.2/yq_linux_amd64
chmod +x yq
sudo mv yq /usr/bin/yq

# Install dust
cargo install du-dust

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

# install duf
curl -L -o duf.rpm https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.rpm
sudo dnf localinstall -y duf.rpm
rm duf.rpm

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-fish --all

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh --shell /usr/bin/zsh $(whoami)

# Neovim
mkdir -p ${HOME}/.config/nvim/
ln -sf ${PWD}/nvim/init.vim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
pip3 install --upgrade pynvim

# compile YCM
pushd ${HOME}/.vim/plugged/YouCompleteMe
{
    ./install.py --go-completer --rust-completer
}
popd

# install alacritty
git clone git@github.com:alacritty/alacritty.git $HOME/alacritty
alacritty_tag='v0.12.3'
pushd $HOME/alacritty
{
    git checkout tags/${alacritty_tag}
    cargo build --release
    # create terminfo
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    # Create entry for alacritty
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
}
popd

# Alacritty
mkdir -p ${HOME}/.config/alacritty/
ln -sf ${PWD}/alacritty/alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Tmux
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm --depth=1
ln -sf ${PWD}/tmux/tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/tmux/theme.tmux ${HOME}/.theme.tmux

# Git
ln -sf ${PWD}/git/gitconfig ${HOME}/.gitconfig
ln -sf ${PWD}/git/gitignore ${HOME}/.gitignore

# i3
mkdir -p ${HOME}/.config/i3
ln -sf ${PWD}/i3/i3_config ${HOME}/.config/i3/config

# wallpaper
mkdir -p ${HOME}/wallpaper
curl -L -o ${HOME}/wallpaper/1.jpg https://w.wallhaven.cc/full/6d/wallhaven-6dekqw.png

# ssh
ln -sf ${PWD}/ssh/config ${HOME}/.ssh/config

# install i3status-rust
git clone https://github.com/greshake/i3status-rust
pushd i3status-rust
{
    cargo install --path .
    ./install.sh
}
popd
rm -rf i3status-rust

# i3 status rust config
ln -sf ${PWD}/i3status-rust ${HOME}/.config/i3status-rust

# Rust 
rustup component add rustfmt rust-src
cargo install rusty-tags

# Go
mkdir -p ${HOME}/go

# install z
curl -L -o ${HOME}/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
echo '. $HOME/.zsh' >> $HOME/.zshrc

# zshrc
echo 'source ${HOME}/dotfiles/zsh/zshrc' >> ${HOME}/.zshrc

# passwords, to be filled in manually
touch $HOME/.passwords

# install kubectl
kube_version='v1.28.2'
curl -LO "https://dl.k8s.io/release/${kube_version}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Wireguard
mkdir -p /etc/wireguard
sudo chown root:root -R /etc/wireguard && sudo chmod 600 -R /etc/wireguard
# put configs here
