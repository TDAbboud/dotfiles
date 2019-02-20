# heavily inspired by the wonderful pure theme
# https://github.com/sindresorhus/pure

# expand parameters on prompt
setopt prompt_subst

# needed to get things like current git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' use-simple true
zstyle ':vcs_info:git*' max-exports 2
zstyle ':vcs_info:git*' formats ' %b' 'x%R'
zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'

autoload colors && colors

git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null;
    if [[ $? -eq 1 ]]; then
        echo "%F{red}✗%f"
    else
        echo "%F{green}✔%f"
    fi
}

upstream_branch() {
    remote=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)) 2>/dev/null
    if [[ $remote != "" ]]; then
        echo "%F{245}($remote)%f"
    fi
}

# get the status of the current branch and it's remote
# If there are changes upstream, display a ⇣
# If there are changes that have been committed but not yet pushed, display a ⇡
git_arrows() {
    # do nothing if there is no upstream configured
    command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

    local arrows=""
    local status
    arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"

    # do nothing if the command failed
    (( !$? )) || return

    # split on tabs
    arrow_status=(${(ps:\t:)arrow_status})
    local left=${arrow_status[1]} right=${arrow_status[2]}

    (( ${right:-0} > 0 )) && arrows+="%F{011}⇣%f"
    (( ${left:-0} > 0 )) && arrows+="%F{012}⇡%f"

    echo $arrows
}


# indicate a job (for example, vim) has been backgrounded
# If there is a job in the background, display a ✱
suspended_jobs() {
    local sj
    sj=$(jobs 2>/dev/null | tail -n 1)
    if [[ $sj == "" ]]; then
        echo ""
    else
        echo "%{$FG[208]%}✱%f"
    fi
}

precmd() {
    vcs_info
    # print -P '\n%F{8}%~'
}

# Use just the first letter of each directory path
shpwd() {
  echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
}
# PROMPT='`git_dirty` %F{245}$(shpwd)%F{011}$vcs_info_msg_0_%f `git_arrows`%(?.%F{002}.%F{001})$PROMPT_SYMBOL%f '

PROMPT_SYMBOL='❯'

# Use the command 'spectrum_ls' on oh-my-zsh to get the color_code numbers for below
#%(4~|.../%3~|%~) == This checks, if the path is at least 4 elements long (%(4~|true|false)) and, if true, prints some dots with the last 3 elements (.../%3~), otherwise the full path is printed %~.
export PROMPT='`git_dirty` %F{245}%(4~|.../%1~|%~)%F{011}$vcs_info_msg_0_%f `git_arrows`%(?.%F{002}.%F{001})$PROMPT_SYMBOL%f '
# export PROMPT='`git_dirty` %F{245}%(4~|.../%3~|%~)%F{011}$vcs_info_msg_0_%f `git_arrows`%(?.%F{002}.%F{001})$PROMPT_SYMBOL%f '
export RPROMPT='`suspended_jobs`'
# export RPROMPT='`git_dirty`%F{245}$vcs_info_msg_0_%f `upstream_branch``git_arrows``suspended_jobs`'

export OLDPROMPT=$PROMPT
export EMPTY_PROMPT='`git_dirty` %F{245}$PROMPT_SYMBOL%f'

