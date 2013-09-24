# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#GENERAL
alias lsl="ls -la --color"
alias hls="hadoop fs -ls"

#BASH HISTORY MODS
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

#PREVENT OBSENETIES
set -o noclobber

#COLOR
eval $(dircolors -b $HOME/.dircolors)
