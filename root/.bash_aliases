#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: .bash_aliases
#
# !DESCRIPTION: A .bashrc-style file that you can use to contain your own
#  personal settings for the Amazon Web Services cloud computing environment.
#\\
#\\
# !CALLING SEQUENCE:
#  source ~/.bash_aliases
#  (will also be called each time you source ~/.bashrc)
#
# !REMARKS:
#  The .bashrc file contains settings that are common to all users of 
#  GEOS-Chem.  But here you can add settings that would only be applicable
#  to your own environment.
#
# !REVISION HISTORY: 
#  Use the gitk browser to view the revision history!
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# %%%%% Personal settings: Look-and-feel customizations %%%%%
#==============================================================================

# Override the system prompt (96=teal)
PS1="\[\e[1;96m\][\h \W]$\[\e[0m\] "     

# Settings for colorization
export GREP_COLOR=32
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

#==============================================================================
# %%%%% Personal settings: Basic Unix commands %%%%%
#==============================================================================

# General Unix commands
alias disk="du -h -s -c"
alias g="grep -in --color=auto"
alias gt="grep -in --text"
alias gf="gifview -a"
alias m="less"
alias me="xterm &"
alias proc="ps -ef | grep $USER | sort"
alias pu="rm *~"
alias pua="rm .*~"
alias sb=". ~/.bashrc"
alias sba=". ~/.bash_aliases"
alias ssh="ssh -YA"
alias tf="tail --follow"
alias zap="kill -9"
alias cd="cd -P"
alias c="clear"
alias h="history"
alias diff="colordiff"
alias rm="rm -Iv"
alias cp="cp -v"
alias mv="mv -v"

# Directory listing commands
alias ls="ls -CF --time-style=long-iso --color=auto"
alias l1="ls -1"
alias ll="ls -l"
alias llt="ls -lt"
alias lltm="ls -lt | less"
alias la="ls -a"
alias lla="ls -la"
alias llh="ls -lh"

# Invoking local scripts
alias ncpl="~/aws-env/bin/nc_chunk.pl"
alias isco="~/aws-env/bin/isCoards"

# Tmux aliases
alias tmuxnew="tmux new -s "
alias tmuxat="tmux a -t "
alias tmuxde="tmux detach "

# Call ncdump and pipe the result to less
function ncd() {
  ncdump -cts $1 | less
}

# Convert a windows file to Unix
function dos2unix() {
  awk '{ sub("\r$", ""); print }' $1 > $2
}

#==============================================================================
# %%%%% Personal settings: Emacs %%%%%
#==============================================================================

# Suppress emacs warnings
alias emacs="emacs 2 > /dev/null"

#==============================================================================
# %%%%% Cmake %%%%%
#==============================================================================

function strip_ignoreeof_from_arg_list() {
    ##### Strip ignoreeof out of an argument list #####
    argv=""
    for arg in "$@"; do
        if [[ "x${arg}" != "xignoreeof" ]]; then
	    argv+="${arg} "
        fi
    done
    echo "${argv}"
}
    
function config_gc_from_rundir() {
    ##### Function to configure GEOS-Chem from the run directory #####

    # Arguments
    argv=$(strip_ignoreeof_from_arg_list $@)
    echo "%%% Arguments: ${argv}"
    
    # Local variables
    thisDir=$(pwd -P)
    buildDir="build"

    # Error check build directory
    if [[ ! -d ${buildDir} ]]; then
	echo "%%% Invalid build directory! %%%"
	cd ${thisDir}
	return 1
    fi

    # Configure the code for type Release
    cd ${buildDir}
    cmake ../CodeDir -DCMAKE_BUILD_TYPE=Release -DRUNDIR=".." ${argv}
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed configuration! %%%"
	cd ${thisDir}
	return 1
    fi

    # Successful return
    echo "%%% Successful configuration: Release! %%%"
    cd ${thisDir}
    return 0
}

function config_gc_debug_from_rundir() {
    ##### Function to configure GEOS-Chem from the run directory #####

    # Arguments
    argv=$(strip_ignoreeof_from_arg_list $@)
    echo "%%% Arguments: ${argv}"
    
    # Local variables
    thisDir=$(pwd -P)
    buildDir="debug"

    # Error check build directory
    if [[ ! -d ${buildDir} ]]; then
	echo "%%% Invalid build directory! %%%"
	cd ${thisDir}
	return 1
    fi

    # Configure the code
    cd ${buildDir}
    cmake ../CodeDir -DCMAKE_BUILD_TYPE=Debug -DRUNDIR=".." ${argv}
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed configuration! %%%"
	cd ${thisDir}
	return 1
    fi

    # Successful return
    echo "%%% Successful configuration: Debug! %%%"
    cd ${thisDir}
    return 0
}

function build_gc() {
    ##### Function to build GEOS-Chem #####

    # Arguments
    buildDir="${1}"

    # Local variables
    thisDir=$(pwd -P)

    # Error checks
    if [[ ! -d ${buildDir} ]]; then
	echo "%%% Invalid directory: ${buildDir} %%%"
	cd ${thisDir}
	return 1
    fi

    # Code compilation
    cd ${buildDir}
    make -j
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed compilation! %%%"
	cd ${thisDir}
	return 1
    fi

    # Code installation
    make -j install
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed Installation! %%%"
	cd ${thisDir}
	return 1
    fi

    # Success 
    echo "%%% Successful Compilation and Installation! %%%"
    cd ${thisDir}
    return 0
}

# Aliases for compiling from the run directory
alias cf="config_gc_from_rundir $@"
alias bu="build_gc build"
alias cfd="config_gc_debug_from_rundir $@"
alias bud="build_gc debug"

#==============================================================================
# %%%%% Personal settings: Git %%%%%
#==============================================================================

alias clone_gcc="git clone git@github.com:geoschem/GCClassic.git"
alias clone_gchp="git clone git@github.com:geoschem/gchp.git"
alias clone_hco="git clone git@github.com:geoschem/hemco.git"
alias getenv="cd ~/env; git pull origin master"
alias gitc="git -C CodeDir"
alias gl="git log"
alias glo="git log --oneline"
alias glog="git -C src/GEOS-Chem log --oneline "
alias gplog="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem log --oneline "
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias gk="gitk 2>/dev/null &"
alias gka="gitk --all 2>/dev/null &"
alias gpo="git pull origin"
alias gui="git gui 2>/dev/null &"
alias gsu="git submodule update --init --recursive"
alias hlog="git -C src/HEMCO log --oneline "
alias hplog="git -C src/GCHP_GridComp/HEMCO_GridComp/HEMCO log --oneline "
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"
alias gck="git -C src/GEOS-Chem checkout"
alias gpck="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem checkout "

function gcc2gc() {
    ##### Navigate from GCClassic src/GEOS-Chem dir #####
    if [[ -d ./CodeDir ]]; then 
	cd CodeDir/src/GEOS-Chem
    else
	cd src/GEOS-Chem
    fi
}

function gc2gcc() {
    ##### Navigate from src/GEOS-Chem to GCClassic #####
    if [[ -d ../../../CodeDir ]]; then 
	cd ../../..
    else
	cd ../..
    fi
}

function gchp2gc() {
    ##### Navigate from GCHPctm to geos-chem #####
    if [[ -d ./CodeDir ]]; then 
	cd CodeDir/src/GCHP_GridComp/GEOSChem_GridComp/geos-chem
    else
	cd src/GCHP_GridComp/GEOSChem_GridComp/geos-chem
    fi
}

function gc2gchp() {
    ##### Navigate from geos-chem to GCHPctm #####
    if [[ -d ../../../../CodeDir ]]; then 
	cd ../../../../..
    else
	cd ../../../..
    fi
}

function gbup() {
    ###### Set a branch to follow a remote branch #####
    git branch --set-upstream-to=origin/${1} ${1}
}

function gbrd() {
    ##### Remove a remote branch #####
    git branch -r -d origin/$1
}

function gprune() {
    ##### Remove local and remote branches #####
    git branch -d $1
    gbrd $1
}

#==============================================================================
# %%%%% Personal Settings: Python environments %%%%%
#==============================================================================

# Jupyter notebook
alias jup="jupyter notebook --NotebookApp.token='' --no-browser --port=8999 --notebook-dir ~/"

# Select Bob Y's custom environment
alias sag="conda activate geo"
alias sdb="conda deactivate"
export PATH=$PATH:/home/miniconda/bin:$PATH

# Add Python repos to $PYTHONPATH
#export PYTHONPATH=$PYTHONPATH:/home/python/gcpy

# Tell Conda not to activate the base environment
conda config --set auto_activate_base false

#==============================================================================
# %%%%% Logins to other machines %%%%%
#==============================================================================
alias gcfas="$HOME/bin/xt -h fas.harvard.edu -u geoschem &"

#==============================================================================
# %%%%% Personal settings: Amazon Web Services cloud computing %%%%%
#==============================================================================
alias s3cp="aws s3 cp --request-payer=requester "
alias s3ls="aws s3 ls --request-payer=requester "
alias s3rm="aws s3 rm --request-payer=requester "
alias s3sy="aws s3 sync --request-payer=requester "

#EOC
