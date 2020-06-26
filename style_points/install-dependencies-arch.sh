#!/bin/bash
# Author: Ashwin Chatterji <ashwinath@hotmail.com>
# Sets up Dotfiles for Arch Linux
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
    telegram-desktop \
    neofetch \
    ttf-joypixels \
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

# Compile yay
git clone https://aur.archlinux.org/yay.git --depth=1
pushd yay
makepkg -si
popd
rm -rf yay

yay -S --answerdiff=None \
    lightdm-slick-greeter \
    universal-ctags-git
./setup-dotfiles.sh
