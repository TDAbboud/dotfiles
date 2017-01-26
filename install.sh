#!/usr/bin/env bash
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_NONE='\033[0m'
COLOR_YELLOW='\033[1;33m'

function link() {
    echo "Linking all dotfiles..."
    source install/link.sh
    # echo "Linking sublime settings"
    # source install/link_sublime.sh
}

function brew() {
    echo "Brewing Everything..."
    source install/brew.sh
}

function main() {
    if [ "$(uname)" == "Darwin" ]; then
        echo "Installing on OSX"
        echo "Updating OSX settings..."
        source install/osx.sh

    elif [ "$(uname)" == "Linux" ]; then
        # assumes ubuntu
        sudo apt-get -y install zsh
    fi

}


function usage() {
    echo "Usage: $0 [options]"
    echo
    echo "Options"
    echo "  -a   Install everything (This is the default)"
    echo "  -b   Install all brew packages and casks"
    echo "  -h   Get this help message"
    echo "  -l   Link all dotfiles"
    # echo "  -e   Explicit (ask before executing every command)"
    # echo "  -v  Verbose logging"
    exit 1
}

function all() {
    # Run all commands
    echo "all"
}

echo -e "${COLOR_GREEN}Dotfile Install:${COLOR_NONE}"
# Parse the command line args
while getopts ":abhl" Option
do
  case $Option in
    a ) all     ;;
    b ) brew    ;;
    h ) usage   ;;
    l ) link    ;;
    * ) all     ;; # Default.
  esac
done

echo "Initializing submodule(s)..."
# git submodule update --init --recursive



# Install oh-my-zsh
echo -e "Run the following to install oh-my-zsh:\n\t${COLOR_YELLOW}curl -L http://install.ohmyz.sh | sh${COLOR_NONE}"
echo -e "${COLOR_GREEN}✔ All Done!${COLOR_NONE}"
