#!`which bash`

# Congiguration  for a terminal session design by Roman Kalinichenko aka romankrv © 2011-2013
# romankrv AT gmail DOT com

# common alias section
alias r="reset"
alias ll="ls -Al"
alias c=clear
alias du="du -hs"

if [ `uname` == 'Linux' ]; then
  alias ack="ack-grep"
fi

#editor section
export ALTERNATE_EDITOR=""
alias em="emacsclient -nw -c'$@'"
alias kill_emacs="emacsclient -e '(kill-emacs)'"

PS1="\e[0;33m\]\u@\h\[\e[0;32m\] \e[0;36m\]\w\[\e[0;32m\]\n└> \[\e[0m\]"
export HISTCONTROL=ignoredups
export HISTIGNORE="pwd:ls:ls -ltr:ll:ls -la:history:gitk:c:git status:git diff:tree"

#editor section
export EDITOR="emacsclient"
export ALTERNATE_EDITOR=""
alias em="emacsclient -nw -c'$@'"
alias em_kill="emacsclient -e '(kill-emacs)'"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"


CONF_PATH=$HOME/conf

PREVPWD=`pwd`
PREVENV_PATH=
PREV_PS1=
PREV_PATH=
ENV=".virtualenv"
handle_virtualenv(){
  # Automaticaly activation of the virtualenv
  # Create in $HOME the folder: '.virtualenv'
  # In the folder to create the file: '.virtualenv'
  # In '.virtualenv' put the line: VIRTUALENV_PATH=$WORKON_HOME/my_env
  # Run: cd $HOME/.virtualenv and create: virtualenv my_env
  if [ "$PWD" != "$PREVPWD" ]; then
    PREVPWD="$PWD";
    if [ -n "$PREVENV_PATH" ]; then
      if [ "`echo "$PWD" | grep -c $PREVENV_PATH`" = "0" ]; then
         source $PREVENV_PATH/$ENV
         echo "> Virtualenv: `basename $VIRTUALENV_PATH` deactivated"
         PS1=$PREV_PS1
         PATH=$PREV_PATH
         PREVENV_PATH=
      fi
    fi
    # activate virtualenv dynamically
    if [ -e "$PWD/$ENV" ] && [ "$PWD" != "$PREVENV_PATH" ]; then
      PREV_PS1="$PS1"
      PREV_PATH="$PATH"
      PREVENV_PATH="$PWD"
      source $PWD/$ENV
      source $VIRTUALENV_PATH/bin/activate
      echo "> Virtualenv: $VIRTUALENV_PATH activated"
    fi
  fi
}
export PROMPT_COMMAND=handle_virtualenv


#VIRTUALENVWRAPPER
# Verification that virtualenvwrapper has been installed.
if [ ! -f /usr/local/bin/virtualenvwrapper.sh ]; then
    echo "Please, install virtualenvwrapper"
else
    export WORKON_HOME=$HOME/$ENV
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ `uname` = "Darwin" ]; then

    if  [ `which brew` ]; then
       # homebrew autocomletion
       source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    fi

    if [ `which git` ]; then
        # git autocompletn
        source $CONF_PATH/git-completion.bash
    fi
fi

if [ `uname` = "Linux" ]; then
    if [ -f /etc/bash_completion ]; then
       # set autocomletion on tab (for git and other stuff)
       source  /etc/bash_completion
    fi
fi

# Django tab autocomplete for a command's manage.py
source $CONF_PATH/django_bash_completion.sh

# Specific command
if [ -f $CONF_PATH/local.sh ]; then
    source $CONF_PATH/local.sh
fi

# MYSQL SECTION
#export PATH=/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/usr/local/mysql/bin
