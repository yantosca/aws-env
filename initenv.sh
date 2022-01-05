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

# Copy files to the home folder
cp -f ~/aws-env/root/.Xresources   ~
cp -f ~/aws-env/root/.bash_aliases ~
cp -f ~/aws-env/root/.condarc      ~
cp -f ~/aws-env/root/.tmux.conf    ~
cp -f ~/aws-env/root/.gitconfig    ~

# Apply the X11 settings in .Xresources
xrdb ~/.Xresources

# Initialize emacs
cd ~/aws-env/
git submodule update --init --recursive
cp -fR root/.emacs.d ~
cd ~/.emacs.d/emacs-config
./install.sh
cd ~

# Put the bin directory in the search path
export PATH=$PATH:~/aws-env/bin

#EOC
