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

# Copy files
cp -f ~/aws-env/root/.Xdefaults    ~/.Xdefaults
cp -f ~/aws-env/root/.emacs        ~/.emacs
cp -f ~/aws-env/root/.bash_aliases ~/.bash_aliases

# Apply the personal settings in .bash_aliases
source ~/.bash_aliases

#EOC
