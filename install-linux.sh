#!/bin/bash
# Only for Debian

echo 'Setting up configuration';

# git user
git config --global user.email "ashwinath@hotmail.com";
git config --global user.name "ashwinath";

# Oh My Zsh. Gonna make me a 10x developer just by installing this.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

# Debian package manager only
sudo apt update;
sudo apt install neovim build-essential cmake silversearcher-ag python python3 ipython ipython3;

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Copying of rc files
mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/init.vim;
mkdir -p ~/.vim/backup/;
cat .zshrc >> ~/.zshrc;

# install YouCompleteMe
curr_dir=`pwd`;
cd ~/.vim/bundle/YouCompleteMe;
./install.py;
cd $pwd;

# YouCompleteMe Dependencies
pip3 install neovim;

# tmux
cp .tmux/.tmux.conf.local .
ln -s -f tmux.conf
