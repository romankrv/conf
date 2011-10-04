#!/bin/bash

export PS1='\w # '
alias r="reset"
alias ll="ls -Al"


# virtualenv automaticaly activation on entry to folder
PREVPWD=`pwd`
PREVENV_PATH=
PREV_PS1=
PREV_PATH=
export PROMPT_COMMAND=handle_virtualenv
handle_virtualenv(){
  if [ "$PWD" != "$PREVPWD" ]; then
    PREVPWD="$PWD";
    if [ -n "$PREVENV_PATH" ]; then
      if [ "`echo "$PWD" | grep -c $PREVENV_PATH`" = "0"  ]; then
         source $PREVENV_PATH/.venv
         echo "> Virtualenv `basename $VIRTUALENV_PATH` deactivated"
         PS1=$PREV_PS1
         PATH=$PREV_PATH
         PREVENV_PATH=
      fi
    fi
    # activate virtualenv dynamically
    if [ -e "$PWD/.venv" ] && [ "$PWD" != "$PREVENV_PATH" ]; then
      PREV_PS1="$PS1"
      PREV_PATH="$PATH"
      PREVENV_PATH="$PWD"
      source $PWD/.venv
      source $VIRTUALENV_PATH/bin/activate
      echo "> Virtualenv `basename $VIRTUALENV_PATH` activated"
    fi
  fi
}


# This loads RVM into a shell session.
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion


# Homebrew
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
