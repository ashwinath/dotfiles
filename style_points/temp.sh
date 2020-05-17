#!/bin/bash
## Configuration Files
# - LightDM Greeter
sudo ln -sf ${PWD}/slick-greeter.conf /etc/lightdm/slick-greeter.conf

# - i3
mkdir -p ${HOME}/.config/i3/
ln -sf ${PWD}/i3_config ${HOME}/.config/i3/config

# - i3blocks, includes all the binaries
git clone https://github.com/vivien/i3blocks-contrib ~/i3-blocks-contrib --depth=1
mkdir -p ${HOME}/.config/i3blocks/
ln -sf ${PWD}/i3blocks_config ${HOME}/.config/i3blocks/config

# - zshrc
ln -sf ${PWD}/zshrc ${HOME}/.zshrc

# - neovim
mkdir -p ${HOME}/.config/nvim/
ln -sf ${PWD}/init.vim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
pip install neovim

# - alacritty
mkdir -p ${HOME}/.config/alacritty/
ln -sf ${PWD}/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

# - tmux
ln -sf ${PWD}/tmux.conf ${HOME}/.tmux.conf

# - xinitrc
ln -sf ${PWD}/xinitrc ${HOME}/.xinitrc

# - wallpaper
mkdir -p ${HOME}/wallpapers
curl https://w.wallhaven.cc/full/lm/wallhaven-lmp6r2.jpg -o ${HOME}/wallpapers/1.jpg
feh --bg-scale ${HOME}/wallpapers/1.jpg
