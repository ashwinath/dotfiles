#!/bin/bash
# Only for Debian

echo 'Setting up configuration';

# Oh My Zsh. Gonna make me a 10x developer just by installing this.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

# install vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Debian package manager only
sudo apt update;
sudo apt install neovim build-essential cmake silversearcher-ag python python3 ipython ipython3;

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Copying of rc files
mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/init.vim;
mkdir -p ~/.config/git && cp ignore ~/.config/git/ignore
cp -R alacritty ~/.config/alacritty;
mkdir -p ~/.vim/backup/;
cp .tmux.conf ~/.tmux.conf
cat .zshrc >> ~/.zshrc;
cp .gitconfig ~
