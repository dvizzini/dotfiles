#!/bin/bash
PWD=`pwd`

if [ "$#" -ne "1" ]
then
    echo "Must enter machine-name argument"
    exit 1
fi

cp .profile ~/.profile
echo "export PS1=\"\e[01;32m\]$1:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ \"" >> ~/.profile

ln -sn $PWD/.vim ~/.vim
ln -sn $PWD/.vimrc ~/.vimrc
ln -sn $PWD/.screenrc ~/.screenrc
ln -sn $PWD/.dircolors ~/.dircolors

echo "Be sure to run \`. ~/.profile\` from your shell."
