# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    if [ -f "$HOME/.bash_profile" ]; then
        . "$HOME/.bash_profile"
    fi

    # include .bash_aliases if it exists
    if [ -f "$HOME/.bash_aliases" ]; then
        . "$HOME/.bash_aliases"
    fi

    # source global definitions
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi

    if [ -f "$HOME/git-completion.bash" ]; then
        . "$HOME/git-completion.bash"
    fi
fi

#BASH HISTORY MODS
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

#PREVENT OBSENETIES
current_branch() {
    git branch > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "($(git branch 2>/dev/null | grep ^* | awk '{print $2}')) "
    fi
}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# To line up with linux
alias ll="ls -laF"

# free up ^s
stty -ixon

_PS1="\[\e[01;32m\]mac:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ "
export PS1="\[\e[0;35m\]\$(current_branch)$_PS1"

alias hstart="/usr/local/Cellar/hadoop/3.3.0/sbin/start-all.sh"
alias hstop="/usr/local/Cellar/hadoop/3.3.0/sbin/stop-all.sh"

eval "$(/opt/homebrew/bin/brew shellenv)"
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
