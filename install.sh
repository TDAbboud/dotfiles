#!/bin/bash
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_NONE='\033[0m'
COLOR_YELLOW='\033[1;33m'

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

    echo "Link in the iTerm font"
    source install/link_iterm_fonts.sh
elif [ "$(uname)" == "Linux" ]; then
    # assumes ubuntu
    sudo apt-get -y install zsh
fi

# Install oh-my-zsh
echo -e "Run the following to install oh-my-zsh:\n\t${COLOR_YELLOW}curl -L http://install.ohmyz.sh | sh${COLOR_NONE}"

echo -e "${COLOR_GREEN}✔ All Done!${COLOR_NONE}"
