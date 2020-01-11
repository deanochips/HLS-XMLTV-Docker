#!/bin/bash

# For more information regarding bash shells, see:
# https://www.gnu.org/software/bash/manual/bash.html#Bash-Startup-Files

#
# This script is sourced before '/usr/share/entrypoint.sh'
# Look in '/usr/share/entrypoint.sh' for examples of setting
# environment variables in the environment immediately
# after entering the container
#

# Regular Colors
black='\033[0;30m'
red='\033[0;31m'   
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
transparent="\e[0m"			


sleep 0.01 && echo -e "$green "
sleep 0.02 && echo -e "  ██╗░░██╗██╗░░░░░░██████╗  ░░░░██╗  ██╗░░██╗███╗░░░███╗██╗░░░░░████████╗██╗░░░██╗"
sleep 0.02 && echo -e "  ██║░░██║██║░░░░░██╔════╝  ░░░██╔╝  ╚██╗██╔╝████╗░████║██║░░░░░╚══██╔══╝██║░░░██║"
sleep 0.02 && echo -e "  ███████║██║░░░░░╚█████╗░  ░░██╔╝░  ░╚███╔╝░██╔████╔██║██║░░░░░░░░██║░░░╚██╗░██╔╝"
sleep 0.02 && echo -e "  ██╔══██║██║░░░░░░╚═══██╗  ░██╔╝░░  ░██╔██╗░██║╚██╔╝██║██║░░░░░░░░██║░░░░╚████╔╝░"
sleep 0.02 && echo -e "  ██║░░██║███████╗██████╔╝  ██╔╝░░░  ██╔╝╚██╗██║░╚═╝░██║███████╗░░░██║░░░░░╚██╔╝░░"
sleep 0.02 && echo -e "  ╚═╝░░╚═╝╚══════╝╚═════╝░  ╚═╝░░░░  ╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░░░░╚═╝░░░"
echo -e ""
sleep 0.02 && echo -e "  ██╗░░██╗░█████╗░███╗░░░███╗███████╗"
sleep 0.02 && echo -e "  ██║░░██║██╔══██╗████╗░████║██╔════╝"
sleep 0.02 && echo -e "  ███████║██║░░██║██╔████╔██║█████╗░░"
sleep 0.02 && echo -e "  ██╔══██║██║░░██║██║╚██╔╝██║██╔══╝░░"
sleep 0.02 && echo -e "  ██║░░██║╚█████╔╝██║░╚═╝░██║███████╗"
sleep 0.02 && echo -e "  ╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝╚══════╝"
echo -e ""
sleep 0.02 && echo -e "  ██████╗░██████╗░░█████╗░░█████╗░██████╗░░█████╗░░█████╗░░██████╗████████╗██╗███╗░░██╗░██████╗░"
sleep 0.02 && echo -e "  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║████╗░██║██╔════╝░"
sleep 0.02 && echo -e "  ██████╦╝██████╔╝██║░░██║███████║██║░░██║██║░░╚═╝███████║╚█████╗░░░░██║░░░██║██╔██╗██║██║░░██╗░"
sleep 0.02 && echo -e "  ██╔══██╗██╔══██╗██║░░██║██╔══██║██║░░██║██║░░██╗██╔══██║░╚═══██╗░░░██║░░░██║██║╚████║██║░░╚██╗"
sleep 0.02 && echo -e "  ██████╦╝██║░░██║╚█████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║██████╔╝░░░██║░░░██║██║░╚███║╚██████╔╝"
sleep 0.02 && echo -e "  ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░"
echo -e ""
sleep 0.01
echo -e $yellow"             for all your entertainment needs  ("$red"There is always something good on...."$yellow")"
sleep 0.01
echo -e $blue "           	      Made with <3 by:"$yellow" deanochips ("$red"deanochips@gmail.com"$yellow")"
sleep 0.01
echo -e ""


# colorized pretty print "username pwd $ "
export PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u \[\033[01;34m\]\w \$\[\033[00m\] '


# Aliases
alias sudo='sudo '              # sudo: make aliases work
alias nano='nano -wcAiLS'       # nano: -w: don't wrap long lines
                                #       -c: constantly show cursor position
                                #       -A: enable smart home key
                                #       -i: automatically indent new lines
                                #       -L: don't add newlines to the ends of files
                                #       -S: scroll by line instead of half-screen
alias apk='apk --progress'      # apk: show progress bar

# Shell Options
shopt -s checkwinsize

# Color Definitions for .bashrc
COL_YEL="\[\e[1;33m\]"
COL_GRA="\[\e[0;37m\]"
COL_WHI="\[\e[1;37m\]"
COL_GRE="\[\e[1;32m\]"
COL_RED="\[\e[1;31m\]"

# Bash Prompt
if test "$UID" -eq 0 ; then
        _COL_USER=$COL_RED
        _p=" #"
else
        _COL_USER=$COL_GRE
        _p=">"
fi


COLORIZED_PROMPT="${_COL_USER}\u${COL_WHI}@${COL_YEL}\h${COL_WHI}:\w${_p} \[\e[m\]"
case $TERM in
        *term | rxvt | screen )
                PS1="${COLORIZED_PROMPT}\[\e]0;\u@\h:\w\007\]" ;;
        linux )
                PS1="${COLORIZED_PROMPT}" ;;
        * )
                PS1="\u@\h:\w${_p} " ;;
esac
