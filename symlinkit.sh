#!/bin/bash
PWD=`pwd`

if [ "$#" -lt "2" ]
then
    echo "Must enter machine-name argument and mac/linux"
    exit 1
fi

if [ "$2" = "mac" ]
then
    cp .mac_profile ~/.profile
else
    cp .profile ~/.profile
    ln -sn $PWD/.dircolors ~/.dircolors
fi

echo "export PS1=\"\e[01;32m\]$1:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ \"" >> ~/.profile

ln -sn $PWD/.vim ~/.vim
ln -sn $PWD/.vimrc ~/.vimrc
ln -sn $PWD/.gitignore_global ~/.gitignore_global
ln -sn $PWD/.screenrc ~/.screenrc

echo "Be sure to run \`. ~/.profile\` from your shell."
