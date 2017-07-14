# Reload the zsh config
alias reload!='source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Utilities
alias o='open'
alias t='zshStartTime'

# Editors
alias vim="nvim"
alias emacs="/usr/local/Cellar/emacs-plus/25.2/bin/emacs"
alias emacsclient="/usr/local/Cellar/emacs-plus/25.2/bin/emacsclient"
alias ec="emacsclient -c -n"
alias ect="emacsclient -nw"

alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias ls="ls ${colorflag}"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias cleanpyc="find . -name '*.pyc' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Always use a pager for ag
alias ag="ag --pager=less"

# Go to go directory quicker
alias god='$HOME/dev/go/src/github.com/tdabboud'
alias godp='$HOME/dev/go/src/github.palantir.build'
# Go to my notes directory
alias cdnotes='cd $HOME/dev/notes'

# Launch Pyspark and Jupyter
alias launchPyspark='docker run -v /Users/tabboud/dev/repos/github.com/tdabboud/jupyter-notebooks:/home/jovyan/work -p 8888:8888 jupyter/pyspark-notebook'

