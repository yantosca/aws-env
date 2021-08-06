#!/bin/bash

#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: initenv.sh
#
# !DESCRIPTION: Copies startup files from ~/aws-env/root to your home
#  directory.
#\\
#\\
# !CALLING SEQUENCE:
#  ~/aws-env/initenv.sh
#
# !REVISION HISTORY: 
#  Use the gitk browser to view the revision history!
#EOP
#------------------------------------------------------------------------------
#BOC

# Fetch the emacs-config submodule
cd ~/aws-env
git submodule update --init --recursive
cd ~

# Copy files to the home folder
cp -f  ~/aws-env/root/.Xresources   ~
cp -fR ~/aws-env/root/.emacs.d      ~
cp -f  ~/aws-env/root/.bash_aliases ~
cp -f  ~/aws-env/root/.condarc      ~
cp -f  ~/aws-env/root/.tmux.conf    ~
cp -f  ~/aws-env/root/.gitconfig    ~

# Put the bin directory in the search path
export PATH=$PATH:~/aws-env/bin

#EOC
