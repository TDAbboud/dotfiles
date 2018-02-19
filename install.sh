#!/usr/bin/env bash

COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_NONE='\033[0m'
COLOR_YELLOW='\033[1;33m'

OS="$(uname)"


function bootstrap() {
    echo "Bootstrapping the system"

    echo "Updating submodule(s)..."
    git submodule update --init --recursive

    if [ "$OS" == "Darwin" ]; then
        echo "Brewing Everything..."
        bash install/brew.sh everything

        echo "Updating OSX settings..."
        bash install/osx.sh

        echo "Link in the iTerm font"
        source install/link_iterm_fonts.sh
    elif [ "$OS" == "Linux" ]; then
        echo "nothing to do"
    else
        echo "Unsupported OS type!"
        exit 1
    fi
}

function dotfiles() {
    echo "Linking all dotfiles..."
    if [ "$OS" == "Darwin" ]; then
        bash install/brew.sh install-stow
        bash install/run_stow.sh osx
    elif [ "$OS" == "Linux" ]; then
        bash install/run_stow.sh linux
    else
        echo "Unsupported OS type!"
        exit 1
    fi
}

function all() {
    dotfiles
    bootstrap
}

function usage() {
cat<<EOD
Usage:
    bootstrap   [options] -- Just install software packages
    dotfiles    [options] -- Just link all dotfiles
    all         [options] -- Install software and link dotfiles
EOD
  exit 1
}

if [[ "$#" == "0" ]]; then
  usage
fi

command="$1"
if [[ "$command" == "" ]]; then
  echo "first argument must be a command"
  usage
fi

case "$command" in 
  all)
    all
    ;;
  dotfiles)
    dotfiles
    ;;
  bootstrap)
    bootstrap
    ;;
  *)
    usage
    ;;
esac

echo -e "${COLOR_GREEN}✔ All Done!${COLOR_NONE}"
exit 0
