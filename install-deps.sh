#!/bin/bash

if [ "$(uname)" == "Linux" ]; then
    pushd ubuntu
elif [ "$(uname)" == "Darwin" ]; then
    pushd macos
fi

./install.sh
popd

./install-dotfiles.sh
