#!/bin/bash

# need to install XQuartz first.
# http://xquartz.macosforge.org/

echo 'Setting up configuration';
xcode-select --install;

# git user
git config --global user.email "ashwinath@hotmail.com";
git config --global user.name "ashwinath";

# Oh My Zsh. Gonna make me a 10x developer just by installing this.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Misc stuff
brew install the_silver_searcher fzf neovim zsh cmake python python3 ipython ipython3 koekeishiya/formulae/skhd;

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Chunkwm
brew tap crisidev/homebrew-chunkwm;
brew install chunkwm;

# MPD + ncmpcpp
brew tap mopidy/mopidy;
brew install mopidy;
brew install mopidy/mopidy/mopidy-spotify;
pip2 install Mopidy-Spotify-Tunigo;
ln -s /usr/local/Cellar/libspotify/12.1.51/lib/libspotify /Library/Frameworks/libspotify.framework/libspotify;

# Copying of rc files.
mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/init.vim;
mkdir -p ~/.vim/backup/;
cp .chunkwmrc ~/.chunkwmrc;
cat .zshrc >> ~/.zshrc;
cp -r .ncmpcpp ~;
cp -r mopidy ~/.config;
cp .skhdrc ~/.skhdrc

# Start chunkwm
brew services start crisidev/chunkwm/chunkwm;

# Start skhd
brew services start skhd

# Start mpd
brew services start mopidy

# tmux
cp .tmux/.tmux.conf.local .
ln -s -f tmux.conf
