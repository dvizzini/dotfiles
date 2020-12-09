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

    # tac all day every day
    ln -s /usr/local/bin/gtac /usr/local/bin/tac
else
    cat .profile_header .profile_linux > ~/.profile
    [ ! -f ~/.dircolors ] && ln -sn $PWD/.dircolors ~/.dircolors
fi

echo >> ~/.profile
echo "_PS1=\"\[\e[01;32m\]$1:\[\e[01;34m\]\w\[\e[01;35m\]\[\033[00m\] $ \"" >> ~/.profile
echo 'export PS1="\[\e[0;35m\]\$(current_branch)$_PS1"' >> ~/.profile

[ ! -d ~/.vim ] && ln -sn $PWD/.vim ~/.vim
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

# get pip
if [ "$2" = "mac" ]
then
    # get brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    sudo easy_install pip
    brew update
    brew install coreutils
    brew install wget
    brew install pyenv
    brew install awscli

    pyenv install 3.8.6
    pyenv global 3.8.6
    eval "$(pyenv init -)"
else
    sudo apt-get -y install python-pip
    sudo apt-get -y install wget
fi

# get flake8 for sytastic
sudo pip install flake8

# git auto-complete
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~

echo "Be sure to run \`. ~/.profile\`" 1>&2
