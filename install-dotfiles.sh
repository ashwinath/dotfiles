#!/bin/bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-fish

# Oh My Zsh
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH=no sh install.sh

# Neovim
mkdir -p ${HOME}/.config/nvim/
ln -sf ${PWD}/nvim/init.vim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
pip install neovim

# compile YCM
pushd ${HOME}/.vim/plugged/YouCompleteMe
{
    ./install.py --go-completer --rust-completer
}
popd

# Alacritty
mkdir -p ${HOME}/.config/alacritty/
ln -sf ${PWD}/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

# Tmux
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm --depth=1
ln -sf ${PWD}/tmux/tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/tmux/theme.tmux ${HOME}/.theme.tmux

# Git
ln -sf ${PWD}/git/gitconfig ${HOME}/.gitconfig
ln -sf ${PWD}/git/gitignore ${HOME}/.gitignore

# i3-gaps
mkdir -p ${HOME}/.config/i3
ln -sf ${PWD}/i3/i3_config ${HOME}/.config/i3/config

# wallpaper
mkdir -p ${HOME}/wallpaper
curl -L -o ${HOME}/wallpaper/1.jpg https://w.wallhaven.cc/full/nr/wallhaven-nr7zq0.jpg

# i3status-rust 
ln -sf ${PWD}/i3status-rust ${HOME}/.config/i3status-rust

# yabai
ln -sf ${PWD}/yabai/.yabairc ${HOME}/.yabairc
ln -sf ${PWD}/yabai/.skhdrc ${HOME}/.skhdrc
