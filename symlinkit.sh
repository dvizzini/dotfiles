#!/bin/bash
PWD=`pwd`

if [ "$#" -ne "1" ]
then
    echo "Must enter machine-name argument"
    exit 1
fi

ln -sn $PWD/.dircolors ~/.dircolors
cp .bashrc ~/.bashrc
echo "export PS1=\"\e[01;32m\]$1:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ \"" >> ~/.bashrc
ln -sn $PWD/.profile ~/.profile
ln -sn $PWD/.bash_profile ~/.bash_profile
ln -sn $PWD/.vim ~/.vim
ln -sn $PWD/.vimrc ~/.vimrc
ln -sn $PWD/.screenrc ~/.screenrc

. ~/.bash_profile
