# options that should be mostly pretty agreeable

# use ctrl-A, ctrl-E bindings
setopt emacs

# no c-s/c-q output freezing
setopt noflowcontrol
# allow expansion in prompts
setopt prompt_subst

# Directory
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


# History
setopt hist_reduce_blanks
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

# display PID when suspending processes as well
setopt longlistjobs
# try to avoid the 'zsh: no matches found...'
setopt nonomatch
# report the status of backgrounds jobs immediately
setopt notify
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all
# use zsh style word splitting
setopt noshwordsplit
# allow use of comments in interactive code
setopt interactivecomments
setopt interactive

setopt extended_glob

# avoid "beep"ing
setopt nobeep

# don't push the same dir twice.
setopt pushd_ignore_dups

setopt complete_aliases

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup
setopt no_bg_nice

# Make the up and down arrow keys search history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Make the keyboard work like normal
# Home Key
bindkey '^[[1~' beginning-of-line
# End Key
bindkey '^[[4~' end-of-line
# Delete Key
bindkey '^[[3~' delete-char

setopt monitor
setopt pushdminus
setopt sharehistory
setopt zle
