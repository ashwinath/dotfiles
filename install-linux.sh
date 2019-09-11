#!/bin/bash
# Only for Debian

echo 'Setting up configuration';

# Debian package manager only
sudo apt update;
sudo apt install neovim build-essential cmake silversearcher-ag python python3 ipython ipython3 curl zsh;

# Oh My Zsh. Gonna make me a 10x developer just by installing this.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

# spaceship bzzzzzzz
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Copying of rc files
mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/init.vim;
mkdir -p ~/.config/git && cp ignore ~/.config/git/ignore
cp -R alacritty.yml ~/.config/alacritty.yml;
mkdir -p ~/.vim/backup/;
cp .tmux.conf ~/.tmux.conf
cat .zshrc >> ~/.zshrc;
cp .gitconfig ~

# TODO: need to add compiling of ripgrep
