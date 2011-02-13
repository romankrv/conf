# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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
export LANGUAGE="ru:ru_UA:en"

          ##                          ## 
           #-- romankrv's changes --#
          ##                          ##

export EDITOR="emacs"
alias pon="sudo pon wgen"
alias poff="sudo poff wgen"

## Ruby RVM
[ -z "$PS1" ] && return
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  && source ~/.rvm/scripts/rvm && export rvm_pretty_print_flag=1
##
export HISTCONTROL=ignorebothexport

#Oracle configuration 
export ORACLE_HOME=/usr/lib/oracle/10.2.0.3/client
export PATH=/usr/lib/oracle/10.2.0.3/client/bin:/usr/lib/oracle/10.2.0.3/client/bin:/bin:/home/r/VIRTUALENVS/PROJ_1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export LD_LIBRARY_PATH=/usr/lib/oracle/10.2.0.3/client/lib:
export TNS_ADMIN=/home/r/oracle_conf
