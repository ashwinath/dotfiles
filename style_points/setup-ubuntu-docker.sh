#/bin/bash
set -e

export TZ="Asia/Singapore"
export DEBIAN_FRONTEND="noninteractive"

apt update && apt install -y \
    tmux \
    zsh \
    neovim \
    automake \
    pkg-config \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    make \
    build-essential \
    gcc \
    git \
    python3 \
    python3-pip

git clone https://github.com/universal-ctags/ctags.git
pushd ctags
./autogen.sh
./configure
make
make install
popd
rm -rf ctags

# Oh my zsh
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH=no sh install.sh

# - zshrc
ln -sf ${PWD}/zshrc ${HOME}/.zshrc

# - neovim
mkdir -p ${HOME}/.config/nvim/
ln -sf ${PWD}/init.vim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
pip3 install neovim

# - tmux
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm --depth=1
ln -sf ${PWD}/tmux.conf ${HOME}/.tmux.conf
ln -sf ${PWD}/theme.tmux ${HOME}/.theme.tmux
