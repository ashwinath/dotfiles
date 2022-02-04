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

# Alacritty
mkdir -p ${HOME}/.config/alacritty/
ln -sf ${PWD}/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

# Tmux
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm --depth=1
ln -sf ${PWD}/tmux/tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/tmux/theme.tmux ${HOME}/.theme.tmux

# Git
ln -sf ${PWD}/git/gitconfig ${HOME}/.gitconfig

# i3-gaps
mkdir -p ${HOME}/.config/i3
ln -sf ${PWD}/i3/i3_config ${HOME}/.config/i3/config
pushd ${HOME}
{
    git clone git@github.com:vivien/i3blocks-contrib.git 
}
mkdir -p ${HOME}/.config/i3blocks
ln -sf ${PWD}/i3/i3blocks_config ${HOME}/.config/i3blocks/config

pushd ${HOME}
{
    git clone https://github.com/vivien/i3blocks i3blocks-git
    pushd i3blocks-git
    {
        ./autogen.sh
        ./configure
        make
        sudo make install
    }
    popd
    rm -f i3blocks-git
}
popd
