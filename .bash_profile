# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
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

# run autokinit
#autokinit
