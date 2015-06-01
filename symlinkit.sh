#!/bin/bash
PWD=`pwd`

if [ "$#" -lt "2" ]
then
    echo "Must enter machine-name argument and mac/linux"
    exit 1
fi

if [ "$2" = "mac" ]
then
    cat .mac_profile .profile_footer > ~/.profile
else
    cp .linux_profile .profile_footer > ~/.profile
    ln -sn $PWD/.dircolors ~/.dircolors
    ln -sn $PWD/.gitignore_global ~/.gitignore_global
fi

echo "export PS1=\"\e[01;32m\]$1:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ \"" >> ~/.profile

ln -sn $PWD/.vim ~/.vim
ln -sn $PWD/.vimrc ~/.vimrc
ln -sn $PWD/.screenrc ~/.screenrc

#git config
git config --global core.autocrlf false
git config --global user.name "Daniel Vizzini"
git config --global user.email dvizzini@contextrelevant.com
git config --global core.excludesfile .gitignore_global
git config --global alias.lg "log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
git config --global alias.glol "log --all --color --graph --pretty=format:'%Cred%h%Creset%x09%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(blue)[%an]%Creset' --abbrev-commit"
git config --global color.ui "diff --color-words"

echo "Be sure to run \`. ~/.profile\` from your shell." 1>&2
