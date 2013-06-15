#!`which bash`

# congigure file for terminal app design by Roman Kalinichenko aka romankrv © 2011-2013
# romankrATgmailDOTcom

# section
alias r="reset"
alias ll="ls -Al"
alias c=clear
alias ack="ack-grep"

export PS1="\[\033[1;34m\][\W]$\[\033[0m\] "

# improve history section
export HISTCONTROL=ignoredups
export HISTIGNORE="pwd:ls:ls -ltr:ll:ls -la:emacs:history:gitk:c:cd ~:cd -:git status:git diff:tree"


# Virtualenv automaticaly activation on entry to folder
 # Create in $HOME folder with name ".VENVS"
 # in folder of project to create file with name ".VENVS" and 
 # type VIRTUALENV_PATH=$HOME/.VENVS/myprojet_env there
 #  e.g. VIRTUALENV_PATH=$HOME/.VENVS/myproject_env
 #  cd `$HOME/.VENVS` and create virtualenv myproject_env

PREVPWD=`pwd`
PREVENV_PATH=
PREV_PS1=
PREV_PATH=
ENV=".VENVS"

handle_virtualenv(){
  if [ "$PWD" != "$PREVPWD" ]; then
    PREVPWD="$PWD";
    if [ -n "$PREVENV_PATH" ]; then
      if [ "`echo "$PWD" | grep -c $PREVENV_PATH`" = "0"  ]; then
         source $PREVENV_PATH/$ENV
         echo "> Virtualenv `basename $VIRTUALENV_PATH` deactivated"
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
      echo "> Virtualenv `basename $VIRTUALENV_PATH` activated"
    fi
  fi
}
export PROMPT_COMMAND=handle_virtualenv


if [ ! -f /usr/local/bin/virtualenvwrapper.sh ]; then
    echo "You could use virtualenvwraper, so please install virtualenvwraper: pip install virtualenvwrapper"
else
    export WORKON_HOME=$HOME/$ENV
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    source /usr/local/bin/virtualenvwrapper.sh
fi


if [ `uname` = "Darwin" ]; then
    if  [ `which brew` ]; then
       # set homebrew autocomletion on tab
       source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
       PATH=$PATH:/usr/local/Cellar/gettext/0.18.2/bin/
    fi

    if [ `which git` ]; then
        # sets git autocomplete on tab-button  
        source /usr/share/git-core/git-completion.bash
    fi
fi


if [ `uname` = "Linux" ]; then
    if [ -f /etc/bash_completion ]; then
       # set autocomletion on tab (for git and other stuff)
       source  /etc/bash_completion
    fi
fi

if [ `which rvm` ] ; then
   # This loads RVM into a shell session.
    [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
    [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
    PATH=$PATH:/opt/macports/bin:/opt/macports/sbin
fi

export PS1="\[\e[0;1m\]( \[\e[31;1m\]\u@\h\[\e[0;1m\] ) - ( \[\e[36;1m\]\w\[\e[0;1m\] )\n└> \[\e[0m\]"


# Check out that virtualenvwrapper has installed
if [ ! -f /usr/local/bin/virtualenvwrapper.sh ];
then
    echo "File not found!"
    echo "Pease install virtualenvwraper: sudo pip install virtualenvwrapper"
else
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Django tab autocomplete for a command's manage.py
. $HOME/django_bash_completion.sh


# Specific command 
alias ARC_STOMATOLOG="cd ~/django_sites/ && ls -al | grep 'stomatolog.tar'  && rm stomatolog.tar && tar -zcf stomatolog.tar stomatolog && ll | grep 'stomatolog.tar' && cd -"
