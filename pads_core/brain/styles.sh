#!/bin/bash

#
# Font Colors
#
white="$(tput setaf 15)"
blue="$(tput setaf 27)"
red="$(tput setaf 1)"
green="\[$(tput setaf 2)\]"
yellow="$(tput setaf 11)"
nc='\033[0m'

#
# Font Styles
#
blink="$(tput blink)"
bold='\e[1m'
r="\[$(tput sgr0)\]"

#
# Terminal Input Styles
#
PS1="${green}[ \# \u@\h \w ] \$ ${r}"
PS2="${yellow}>>>>${nc}"
