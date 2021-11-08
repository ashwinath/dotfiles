#!/bin/bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-zsh --no-fish

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

# Alacritty
mkdir -p ${HOME}/.config/alacritty/
ln -sf ${PWD}/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

# Tmux
#git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm --depth=1
ln -sf ${PWD}/tmux/tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/tmux/theme.tmux ${HOME}/.theme.tmux

# Git
ln -sf ${PWD}/git/gitconfig ${HOME}/.gitconfig
