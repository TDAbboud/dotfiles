#!/bin/bash
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_NONE='\033[0m'

echo "==> Installing dotfiles"

echo "Initializing submodule(s)..."
git submodule update --init --recursive

echo "Linking all dotfiles..."
source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Installing on OSX"

    echo "Brewing Everything..."
    source install/brew.sh

    echo "Updating OSX settings..."
    source install/osx.sh

    echo "Linking sublime settings"
    source install/link_sublime.sh
elif [ "$(uname)" == "Linux" ]; then
    # assumes ubuntu
    sudo apt-get -y install zsh
fi

# Install oh-my-zsh
echo "Run the following to install oh-my-zsh"
echo "curl -L http://install.ohmyz.sh | sh"

echo -e "${COLOR_GREEN}✔ All Done!${COLOR_NONE}"
