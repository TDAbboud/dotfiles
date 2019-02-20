export DOTFILES=$HOME/.dotfiles
export ZSH_DIR=$HOME/.zsh
export EDITOR=nvim
export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH

# fix for loading failures
autoload bashcompinit
bashcompinit

# oh-my-zsh settings
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# source all .zsh files inside of the $DOTFILES/zsh/ directory
for config ($HOME/.zsh/**/*.zsh) source $config

# Base16 Shell / Terminal Theme
BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Virtualenv Settings (Lazy Loaded)
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper_lazy.sh

# Go Stuff
# export GOROOT=$(go env GOROOT)
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOROOT:$GOPATH/bin

# FZF config
#TODO: LAZY LOAD this source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use ag instead of find for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# Load all custom settings
# ~/.path   -> extend the PATH env variable
# ~/.custom -> custom settings
for file in ~/.{path,custom.local}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file

os_name=$(uname -s)
# remap capslock to ctrl on linux
if [[ "$os_name" == "Linux" ]]; then
    setxkbmap -layout us -option ctrl:nocaps
fi

