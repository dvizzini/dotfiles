#!/bin/bash
PWD=`pwd`

if [ "$#" -lt "2" ]
then
    echo "Must enter machine-name argument and mac/linux"
    exit 1
fi

if [ "$2" = "mac" ]
then
    cat .profile_header .profile_mac > ~/.profile
else
    cat .profile_header .profile_linux > ~/.profile
    [ ! -f ~/.dircolors ] && ln -sn $PWD/.dircolors ~/.dircolors
fi

echo "export PS1=\"\e[01;32m\]$1:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ \"" >> ~/.profile

[ ! -f ~/.vim ] && ln -sn $PWD/.vim ~/.vim
[ ! -f ~/.vimrc ] && ln -sn $PWD/.vimrc ~/.vimrc
[ ! -f ~/.gitignore_global ] && ln -sn $PWD/.gitignore_global ~/.gitignore_global
[ ! -f ~/.screenrc ] && ln -sn $PWD/.screenrc ~/.screenrc

#git config
git config --global core.autocrlf false
git config --global user.name "Daniel Vizzini"
git config --global user.email dvizzini@contextrelevant.com
git config --global core.excludesfile "~/.gitignore_global"
git config --global alias.lg "log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
git config --global alias.glol "log --all --color --graph --pretty=format:'%Cred%h%Creset%x09%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(blue)[%an]%Creset' --abbrev-commit"
git config --global alias.df "diff --color-words"
git config --global color.ui "true"

echo "Be sure to run \`. ~/.profile\` from your shell." 1>&2
