#!/bin/bash

echo 'Setting up configuration';
xcode-select --install;

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Misc stuff
brew install ctags the_silver_searcher fzf neovim zsh cmake;

# Chunkwm
brew tap crisidev/homebrew-chunkwm;
brew install chunkwm

# Oh My Zsh. Gonna make me a 10x developer just by installing this.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

# Copying of rc files.
mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/init.vim;
mkdir -p ~/.vim/backup/;
cp .chunkwmrc ~/.chunkwmrc;
cat .zshrc >> ~/.zshrc;

# Start chunkwm
brew services start crisidev/chunkwm/chunkwm;

