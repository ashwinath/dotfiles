#!/bin/bash

pushd ubuntu
{
    ./install.sh
}
popd

./install-dotfiles.sh
