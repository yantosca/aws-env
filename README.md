[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/yantosca/aws-env/blob/master/LICENSE.txt)

# README for the aws-env repository

This repository (https://github.com/yantosca/aws-env) contains several startup files for customizing your Unix login environment on the Amazon Web Services cloud computing environment.

## Contents
The table below lists all of the files contained in the aws-env repository:

### Files in the top-level (```./```) folder:

|File | Description|
|-------|------|
|`AUTHORS.txt` |List of developers (part of the license agreement).| 
|`LICENSE.txt`|The license agreement (basedon the MIT license)
|`README.md`|This file.|
|`initenv.sh`|Installation script.  Copies files from bin and root folders into your EBS volume attached to your AWS instance.|

### Files in the ```./bin``` folder:

|File|Description|
|---|---|
|`cmake-mode.el`|Used for emacs initialization -- "colorizes" CMake commands.|
|`.gitignore`|Specifies files in `bin/'' that should not be added to the Git repository.|
|`isCoards.pl`|Script to test if a netCDF file is COARDS-compliant.|
|`nc_chunk.pl`|Script to deflate and chunk a netCDF file.|
|`startup`|Script to start up several xterm windows and an emacs window.|
|`xt`|Script to start an xterm window on a remote machine via OpenSSH.|

### Files in the ```./root``` folder:

|File|Description|
|---|---|
|`.bash_aliases` |Contains your own custom aliases and settings for your Unix login environment.  This will be sourced from the AWS .bashrc file whenever you type "source ~/.bashrc".|
|`.bashrc-ubuntu` |Sample .bashrc file for Ubuntu.  For reference only.|
|`.emacs`|Customization file for the Emacs editor.  Sets the fonts, colors, background, and window sizes.|
|`.gitconfig`|Git configuration file.  Specifies the default font that will be used in the Git GUI and GitK browsers.  Also allows you to define the name and email that you wish to use in commit messages. __MUST EDIT!__
|`.gitignore`|Specifies files in `root/'' that should not be added to the Git repository.|
|`.tmux.conf`|Configuration file for the tmux multiplexer application.|
|`.Xdefaults`|Customization file for X-terminal windows.  Sets the background, cursor, and foreground font colors.|

### Files in the ```./spack``` folder:

|File|Description|
|---|---|
|`packages.yaml` |Sample package configuration file for Spack.  This particular file directs Spack to use Python3 instead of Python2 during the build process.|

### Files in the ```./tau``` folder:

|File|Description|
|---|---|
|`run_tau.sh` |Script to run GEOS-Chem with TAU profiling (default options)|
|`run_tau_function.sh` |Script to run GEOS-Chem with TAU profiling (function-level only)|
|`run_tau_unwind.sh` |Script to run GEOS-Chem with TAU profiling (full unwind)|

## Installation

In the home directory folder of your AWS instance, type:

```  
git clone https://github.com/ryantosca/aws-env.git
```
Then issue the following commands:
```
~/aws-env/initenv.sh
. ~/bash_aliases
``` 
Then all of the settings will be applied to the Unix enviromnent in your AWS instance.  The aws-env/bin folder will also be added to your $PATH variable so that you will be able to run the scripts located there.

Bob Yantosca | 08 Jan 2020 | yantosca@seas.harvard.edu
