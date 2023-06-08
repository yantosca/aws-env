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
alias m="less -CR"
alias me="xterm 2>/dev/null &"
alias proc="ps -ef | grep $USER | sort"
alias pu="rm *~"
alias pua="rm .*~"
alias sb=". ~/.bashrc"
alias sba=". ~/.bash_aliases"
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

#==============================================================================
# %%%%% Personal settings: Emacs %%%%%
#==============================================================================

# Suppress emacs warnings
#alias emacs="emacs 2 > /dev/null"

#==============================================================================
# %%%%% Personal settings: Git commands %%%%%
#==============================================================================

# Aliases for Git commands
#source /etc/bash_completion.d/git    # enable tab-completion
alias clone_gcc="git clone git@github.com:geoschem/GCClassic.git"
alias clone_gchp="git clone git@github.com:geoschem/gchp.git"
alias clone_hco="git clone git@github.com:geoschem/hemco.git"
alias gfp="git fetch -p"
alias gitc="git -C CodeDir"
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias gk="gitk 2>/dev/null &"
alias gka="gitk --all 2>/dev/null &"
alias gkb="gitk 2>/dev/null -b "
alias gpo="git pull origin"
alias gui="git gui 2>/dev/null &"
alias gsu="git submodule update --init --recursive"
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"

# Git shortcuts for GEOS-Chem Classic
alias gcc2gc="cd src/GEOS-Chem"
alias gc2gcc="cd ../.."
alias gcc2hco="cd src/HEMCO"
alias hco2gcc="cd ../.."
alias gck="git -C src/GEOS-Chem checkout"
alias hck="git -C src/HEMCO checkout"
alias glog="git -C src/GEOS-Chem log --oneline "
alias hlog="git -C src/HEMCO log --oneline "

# Git shortcuts for GCHP
alias gchp2gc="cd src/GCHP_GridComp/GEOSChem_GridComp/geos-chem"
alias gc2gchp="cd ../../../.."
alias gchp2hco="cd src/GCHP_GridComp/HEMCO_GridComp/HEMCO"
alias hco2gchp="cd ../../../.."
alias gpck="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem checkout "
alias hpck="git -C src/GCHP_GridComp/HEMCO_GridComp/HEMCO checkout "
alias gplog="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem log --oneline "
alias hplog="git -C src/GCHP_GridComp/HEMCO_GridComp/HEMCO log --oneline "

#==============================================================================
# %%%%% Logins to other machines %%%%%
#==============================================================================
alias gcfas="${HOME}/bin/xt -h fas.harvard.edu -u geoschem &"
alias awsgo="ssh -YA -i ~/.ssh/bmy_aws_keypair.pem "
function awsagent() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/bmy_aws_keypair.pem
}

#==============================================================================
# %%%%% Data paths on Cannon %%%%%
#==============================================================================
export GCGRID_ROOT="/n/holyscratch01/external_repos/GEOS-CHEM/gcgrid"
export DATA_ROOT="${GCGRID_ROOT}/data"
export EXTDATA="${DATA_ROOT}/ExtData"
export HEMCO_DATA_ROOT="${EXTDATA}/HEMCO"
export FTP_ROOT="${GCGRID_ROOT}/geos-chem"
export VAL_ROOT="${FTP_ROOT}/validation"
export SCRATCH_HOME="${SCRATCH}/jacob_lab/$USER"
alias sh="cd ${SCRATCH_HOME}"
alias sgc="cd ${SCRATCH_HOME}/GC"
alias cd_data="cd $dataDir"

#==============================================================================
# %%%%% netCDF %%%%%
#==============================================================================

# Panoply
alias pan="$HOME/bin/panoply.sh &"

# NetCDF scripts
alias ncpl="nc_chunk.pl"
unset dataDir

# Invoking local scripts
alias ncpl="~/aws-env/bin/nc_chunk.pl"
alias isco="~/aws-env/bin/isCoards"

#==============================================================================
# %%%%% Tmux %%%%%
#==============================================================================
alias tmuxnew="tmux new -s "
alias tmuxat="tmux a -t "
alias tmuxde="tmux detach"

# Aliases for compiling from the run directory
alias cf="config_gc_from_rundir $@"
alias bu="build_gc build"
alias cfd="config_gc_debug_from_rundir $@"
alias bud="build_gc debug"
alias mdc="rm -rf build/*; rm -rf debug/*"

# For aerochem/KPP development
alias cfa="cf -DCUSTOMMECH=y $@"
alias cfad="cfd -DCUSTOMMECH=y $@"

#==============================================================================
# %%%%% Misc stuff %%%%%
#==============================================================================

# Misc aliases
alias rmcore="rm core.*"

#==============================================================================
# %%%%% Personal Settings: Python environments %%%%%
#==============================================================================

# Jupyter notebook
alias jup="jupyter notebook --NotebookApp.token='' --no-browser --port=8999 --notebook-dir ~/"

# Select Bob Y's custom environment
alias sag="conda activate geo"
alias sdg="conda deactivate"
export PATH="$PATH:/home/miniconda/bin:$PATH"

# Add Python repos to $PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/home/ubuntu/gcpy

# Tell Conda not to activate the base environment
conda config --set auto_activate_base false

#==============================================================================
# %%%%% Personal settings: Amazon Web Services cloud computing %%%%%
#==============================================================================
alias s3cp="aws s3 cp --request-payer=requester "
alias s3ls="aws s3 ls --request-payer=requester "
alias s3rm="aws s3 rm --request-payer=requester "
alias s3sy="aws s3 sync --request-payer=requester "

#==============================================================================
# %%%%% Personal settings: Add aws-env/bin to PATH %%%%%
#==============================================================================
if [[ ! "~/aws-env/bin" =~ $PATH ]]; then
    export PATH="~/aws-env/bin:${PATH}"
fi

#==============================================================================
# %%%%% Personal settings: Load bash functions %%%%%
#=============================================================================
if [[ -f ~/.bash_functions ]]; then
    . ~/.bash_functions
fi

#EOC
