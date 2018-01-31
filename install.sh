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

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Misc stuff
brew install the_silver_searcher fzf neovim zsh cmake python python3 ipython ipython3 koekeishiya/formulae/skhd rust;

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
cp -R alacritty ~/.config/alacritty;
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

# tmux conf
curr_dir = `pwd`
git clone --recursive https://github.com/ashwinath/tmux-config ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
cd ~/.tmux
git submodule init
git submodule update
cd ~/.tmux/vendor/tmux-mem-cpu-load
mkdir build; cd build
cmake ..
make
sudo make install
cd `curr_dir`

# install alacrity
git clone https://github.com/jwilm/alacritty
cd alacrity
cargo build --release
make app
cp -r target/release/osx/Alacritty.app /Applications/
cd `curr_dir`
