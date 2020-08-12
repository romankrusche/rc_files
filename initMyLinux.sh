#!/bin/bash
# this script will initialize and install all the things I like
# 
# ============================================================================ #

if [[ "X$1" == "X-run" ]]; then # for savity only run this, if you are sure

# install tools {{{ ----------------------------------------------------------
sudo apt-get install htop
sudo apt-get install gcc
sudo apt-get install git
sudo apt-get install gnuplot
# }}}

# vim {{{ -------------------------------------------------------------------- 
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/view
mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/ftdetect
mkdir -p ~/.vim/plugin
# }}}

# get the dotfiles from git {{{ ---------------------------------------------- 
git clone https://github.com/romankrusche/dotfiles
# }}}

fi
