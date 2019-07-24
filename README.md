[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/yantosca/aws-env/blob/master/LICENSE.txt)

# README for the aws-env repository

This repository (https://github.com/yantosca/aws-env) contains several startup files for customizing your Unix login environment on the Amazon Web Services cloud computing environment
 
## Folders
  * __root__: Contains startup scripts that will be linked to your home directory folder.
    * __.bash_aliases__: Contains your own custom aliases and settings for your Unix login environment.  This will be sourced from the AWS .bashrc file whenever you type "source ~/.bashrc"
    * __.emacs__: Customization file for the Emacs editor.  Sets the fonts, colors, background, and window sizes.
    * __.Xdefaults__: Customization file for X-terminal windows.  Sets the background, cursor, and foreground font colors.
    
  * __bin__: Contains handy utility scripts:
    * __isCoards__: Can determine if a netCDF file is COARDS-compliant.
    * __nc_chunk.pl__: Perl script that can be used to deflate and chunk a netCDF file for proper GEOS-Chem I/O.
    * __ncd__: Shortcut script for the "ncdump" command

## Installation
In your home directory folder, type:

    git clone https://github.com/ryantosca/aws-env.git

Then issue the following commands:
  
    ~/aws-env/initenv.sh
    . ~/bash_aliases
    
Bob Yantosca ~ 11 Dec 2018 ~ yantosca@seas.harvard.edu