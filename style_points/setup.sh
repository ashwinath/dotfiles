#!/bin/bash
# Author: Ashwin Chatterji <ashwinath@hotmail.com>
# Sets up Dotfiles for Arch Linux
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
    xclip \
    openssh \
    spotify \
    tree \
    man \
    tmux \
    python-pip \
    sysstat \
    git \
    wget \
    curl \
    i3-gaps \
    i3blocks \
    lightdm \
    xorg-server \
    xorg-xinit \
    feh \
    firefox \
    zsh \
    neovim \
    alacritty \
    rofi \
    docker

# Docker
sudo usermod -aG docker $(whoami)
sudo systemctl start docker
sudo systemctl enable docker

# Compile yay
git clone https://aur.archlinux.org/yay.git --depth=1
pushd yay
makepkg -si
popd
rm -rf yay

yay -S \
    lightdm-slick-greeter \
    universal-ctags-git

# Fonts
git clone https://github.com/ryanoasis/nerd-fonts --depth=1
pushd nerd-fonts
./install.sh
popd
rm -rf nerd-fonts

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-zsh --no-fish

# Oh My Zsh
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH=no sh install.sh

## Configuration Files
# - LightDM Greeter
sudo ln -sf ${PWD}/slick-greeter.conf /etc/lightdm/slick-greeter.conf

# - i3
mkdir -p ${HOME}/.config/i3/
ln -sf ${PWD}/i3_config ${HOME}/.config/i3/config

# - i3blocks, includes all the binaries
git clone https://github.com/vivien/i3blocks-contrib ~/i3-blocks-contrib --depth=1
mkdir -p ${HOME}/.config/i3blocks/
ln -sf ${PWD}/i3blocks_config ${HOME}/.config/i3blocks/config

# - zshrc
ln -sf ${PWD}/zshrc ${HOME}/.zshrc

# - neovim
mkdir -p ${HOME}/.config/nvim/
ln -sf ${PWD}/init.vim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
pip install neovim

# - alacritty
mkdir -p ${HOME}/.config/alacritty/
ln -sf ${PWD}/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

# - tmux
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm --depth=1
ln -sf ${PWD}/tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/theme.tmux ${HOME}/.theme.tmux

# - xinitrc
ln -sf ${PWD}/xinitrc ${HOME}/.xinitrc

# - wallpaper
mkdir -p ${HOME}/wallpapers
curl https://w.wallhaven.cc/full/lm/wallhaven-lmp6r2.jpg -o ${HOME}/wallpapers/1.jpg
feh --bg-scale ${HOME}/wallpapers/1.jpg
