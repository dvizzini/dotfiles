export PIG_OPTS="$PIG_OPTS -Djava.library.path=/usr/lib/hadoop/lib/native/Linux-amd64-64 -Dmapred.job.queue.name=hdmi-set -Dmapred.child.java.opts=-Xmx2048m -Dmapred.task.timeout=0"
export HIVE_OPTS="$HIVE_OPTS -hiveconf mapred.job.queue.name=hdmi-set"
export HIVE_AUX_JARS_PATH=/home/hadoop/lib/HiveUDF.jar
export JAVA_HOME="/usr/java/jdk1.6.0_16/"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# User specific environment and startup programs
if [ -d "$HOME/bin" ]; then
  export PATH=$HOME/bin:$PATH
fi

# money adddition from Volkan
for i in `ls $HOME`
do
  if [ -d "$HOME/$i/current/bin" ]; then
    export PATH=$HOME/$i/current/bin:$PATH
  fi

  if [ -d "$HOME/$i/current/sbin" ]; then
    export PATH=$HOME/$i/current/sbin:$PATH
  fi

  if [ -d "$HOME/$i/current/lib" ]; then
    export LD_LIBRARY_PATH=$HOME/$i/current/lib:$LD_LIBRARY_PATH
  fi

  if [ -d "$HOME/$i/current/lib" ]; then
    export DYLD_LIBRARY_PATH=$HOME/$i/current/lib:$DYLD_LIBRARY_PATH
  fi

  if [ -d "$HOME/$i/current/man" ]; then
    export MANPATH=$HOME/$i/current/man:$MANPATH
  fi
done

#localize python variables
if [ -d "python/current" ]; then
  export PREFIX_PATH="`pwd`/python/current"
  export PYTHONPATH=$PREFIX_PATH/lib/python2.7/site-packages
  alias pip_install="pip install --install-option=\"--prefix=$PREFIX_PATH\""
fi

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

#virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

#COLOR
eval $(dircolors -b $HOME/.dircolors)
