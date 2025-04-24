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
# %%%%% Personal settings: Look-and-feel %%%%%
#==============================================================================

# Override the system prompt (96=teal)
PS1="\[\e[1;96m\][\h \W]$\[\e[0m\] "

# Settings for colorization
export GREP_COLOR=32
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;37:*.tgz=01;37:*.arj=01;37:*.taz=01;37:*.lzh=01;37:*.zip=01;37:*.z=01;37:*.Z=01;37:*.gz=01;37:*.bz2=01;37:*.deb=01;37:*.rpm=01;37:*.jar=01;37:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

#==============================================================================
# %%%%% Personal settings: Basic Linux commands %%%%%
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
alias clone_gcc="git clone --recurse-submodules git@github.com:geoschem/GCClassic.git"
alias clone_gchp="git clone --recurse-submodules git@github.com:geoschem/gchp.git"
alias clone_hco="git clone --recurse-submodules git@github.com:geoschem/hemco.git"
alias gb="git branch"
alias gbr="git branch --remote"
alias gbrnm="git branch --remote --no-merged"
alias gfp="git fetch -p"
alias gitc="git -C CodeDir"
alias gk="gitk 2>/dev/null &"
alias gka="gitk --all 2>/dev/null &"
alias gkb="gitk 2>/dev/null -b "
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias gpo="git pull origin"
alias gsu="git submodule update --init --recursive"
alias gui="git gui 2>/dev/null &"
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"

# Git shortcuts for GEOS-Chem Classic
alias gcc2gc="cd src/GEOS-Chem"
alias gc2gcc="cd ../.."
alias gcc2hco="cd src/HEMCO"
alias hco2gcc="cd ../.."
alias gcc2cj="cd src/Cloud-J"
alias cj2gcc="cd ../.."
alias gck="git -C src/GEOS-Chem checkout"
alias hck="git -C src/HEMCO checkout"
alias glog="git -C src/GEOS-Chem log --oneline "
alias hlog="git -C src/HEMCO log --oneline "

# Git shortcuts for GCHP
alias gchp2gc="cd src/GCHP_GridComp/GEOSChem_GridComp/geos-chem"
alias gc2gchp="cd ../../../.."
alias gchp2hco="cd src/GCHP_GridComp/GEOSChem_GridComp/HEMCO/HEMCO"
alias hco2gchp="cd ../../../../.."
alias gchp2cj="cd src/GCHP_GridComp/GEOSChem_GridComp/Cloud-J"
alias cj2gchp="cd ../../../.."
alias gpck="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem checkout "
alias hpck="git -C src/GCHP_GridComp/GEOSChem_GridComp/HEMCO/HEMCO checkout "
alias gplog="git -C src/GCHP_GridComp/GEOSChem_GridComp/geos-chem log --oneline "
alias hplog="git -C src/GCHP_GridComp/HEMCO_GridComp/HEMCO log --oneline "

#==============================================================================
# %%%%% Personal settings: Tmux %%%%%
#==============================================================================
alias tmuxnew="tmux new -s "
alias tmuxat="tmux a -t "
alias tmuxde="tmux detach"
alias tmuxki="tmux kill-session -t "

#==============================================================================
# %%%%% Personal settings: Cmake %%%%%
#==============================================================================
alias cf="config_gc_from_rundir $@"
alias bu="build_gc build"
alias cfd="config_gc_debug_from_rundir $@"
alias bud="build_gc debug"
alias mdc="rm -rf build/*; rm -rf debug/*"

#==============================================================================
# %%%%% Personal settings: KPP %%%%%
#==============================================================================

# Add path to the KineticPreProcessor at the end of $PATH
export KPP_HOME="${HOME}/repos/KPP3"
export PATH="${PATH}:${KPP_HOME}/bin"

# For KPP C-I tests in the Docker container
alias dbkpp="docker build -f ./.ci-pipelines/Dockerfile -t kpp-build ."
alias drkpp="docker run -it --entrypoint /bin/bash kpp-build"

# KPP directory change aliases
alias kh="cd ${KPP_HOME}"
alias kcp="cd ${KPP_HOME}/.ci-pipelines"
alias kct="cd ${KPP_HOME}/ci-tests"

# Run KPP tests
alias kit="${KPP_HOME}/.ci-pipelines/ci-testing-script.sh"
alias kic="${KPP_HOME}/.ci-pipelines/ci-cleanup-script.sh"

#==============================================================================
# %%%%% Personal settings: AWS cloud %%%%%
#==============================================================================

# Non-recursive
alias s3cp="aws s3 cp "
alias s3ls="aws s3 ls "
alias s3rm="aws s3 rm "
alias s3sy="aws s3 sync "

# Recursive
alias s3cpr="aws s3 cp --recursive "
alias s3lsr="aws s3 ls --recursive "
alias s3rmr="aws s3 rm --recursive "

#==============================================================================
# %%%%% Personal settings: Python %%%%%
#==============================================================================

# Specify installation path for Python packages and environments
export MAMBA_PREFIX="/home/ubuntu/mambaforge"
export MAMBA_ENVS_PATH="${MAMBA_PREFIX}/envs"
export MAMBA_PKGS_DIRS="${MAMBA_PREFIX}/pkgs"
export PATH="$PATH:${MAMBA_PREFIX}/bin:$PATH"

# Environment variables for Python
export PYTHONPATH="${PYTHONPATH}:${HOME}/repos/gcpy"   # Path to GCPy
export PYTHONWARNINGS="ignore::DeprecationWarning"     # Ignore warnings
export PYLINTRC="~/.pylint.rc"                         # Pylint config
export XDG_RUNTIME_DIR="/tmp/runtime-${USER}"          # Temp folder

# Set the X11 backend for Matplotlib
export MPLBACKEND="tkagg"
alias mpl_agg="export MPLBACKEND=agg"                  # No graphics
alias mpl_tkagg="export MPLBACKEND=tkagg"              # X11 graphics

# Convenience aliases for common GCPy routines
alias bmkstats="python -m gcpy.benchmark.modules.benchmark_gcclassic_stats"
alias cmpdiag="python -m gcpy.examples.diagnostics.compare_diags"
alias hotspots="python -m gcpy.profile.vtune_list_hotspots"

# Jupyter notebook
alias jup="jupyter notebook --NotebookApp.token='' --no-browser --port=8999 --notebook-dir ~/"
# Tell Conda not to activate the base environment
conda config --set auto_activate_base false

#==============================================================================
# %%%%% netCDF %%%%%
#==============================================================================

# Invoking local scripts
alias ncpl="~/aws-env/bin/nc_chunk.pl"
alias isco="~/aws-env/bin/isCoards"

#==============================================================================
# %%%%% Misc stuff %%%%%
#==============================================================================

# Misc aliases
alias rmcore="rm core.*"

#==============================================================================
# %%%%% Personal settings: Add aws-env/bin to PATH %%%%%
#==============================================================================
if [[ ! "~/aws-env/bin" =~ $PATH ]]; then
    export PATH="~/aws-env/bin:${PATH}"
fi

#==============================================================================
# %%%%% Logins to other machines %%%%%
#==============================================================================
alias awsgo="ssh -YA -i ~/.ssh/bmy_aws_keypair.pem "
function awsagent() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/bmy_aws_keypair.pem
}

#==============================================================================
# %%%%% Personal settings: Load bash functions %%%%%
#=============================================================================
if [[ -f ~/.bash_functions ]]; then
    . ~/.bash_functions
fi

#EOC
