#/bin/bash

# TODO: Not tested

echo "Installing MacOS dependencies"
xcode-select --install;

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install ripgrep \
    fzf \
    neovim \
    zsh \
    cmake \
    python \
    python3 \
    ipython \
    ipython3 \
    koekeishiya/formulae/skhd \
    rust \
    z

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Yabai + skhd
brew install koekeishiya/formulae/yabai

ln -sf ../yabai/skhdrc ${HOME}/.skhdrc
ln -sf ../yabai/yabairc ${HOME}/.yabairc

sudo yabai --install-sa
brew services start yabai
brew services start skhd

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
