#!/bin/bash
PWD=`pwd`

# tac all day every day
ln -s /usr/local/bin/gtac /usr/local/bin/tac

[ ! -d ~/.vim ] && ln -sn $PWD/.vim ~/.vim
[ ! -f ~/.profile ] && ln -sn $PWD/.profile ~/.profile
[ ! -f ~/.vimrc ] && ln -sn $PWD/.vimrc ~/.vimrc
[ ! -f ~/.gitignore_global ] && ln -sn $PWD/.gitignore_global ~/.gitignore_global
[ ! -f ~/.screenrc ] && ln -sn $PWD/.screenrc ~/.screenrc
[ ! -f ~/.bash_aliases ] && ln -sn $PWD/.bash_aliases ~/.bash_aliases

mkdir -p $HOME/bin
for file in $(ls $PWD/bin); do
    [ ! -f ~/bin/$file ] && ln -sn $PWD/bin/$file ~/bin/
done

# git config
git config --global core.autocrlf false
git config --global user.name "Daniel Vizzini"
git config --global user.email daniel.vizzini@disneystreaming.com
git config --global core.excludesfile "~/.gitignore_global"
git config --global alias.lg "log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
git config --global alias.glol "log --all --color --graph --pretty=format:'%Cred%h%Creset%x09%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(blue)[%an]%Creset' --abbrev-commit"
git config --global alias.df "diff --color-words"
git config --global color.ui "true"

# get brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo easy_install pip
brew update
brew install coreutils
brew install wget
brew install awscli
brew install htop
brew install jq
brew install bazelisk
brew install --cask miniconda

conda config --add channels conda-forge

# get flake8 for sytastic
sudo pip install flake8

# git auto-complete
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~

echo "Be sure to run \`. ~/.profile\`" 1>&2
