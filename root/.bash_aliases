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
# %%%%% Personal settings: Compiling and running GEOS-Chem %%%%%
#==============================================================================

# Run Cmake in the specified subdirectory
function cm() {
   cmake -S CodeDir -B $1
}

# Compile the code in the specified subdirctory w/ CMake Makefiles
function m6() {
   if [[ -d $1 ]]; then
     make -C $1 -j6 install
   fi
}

# Run "cm" and "m6" on the gcbuild subdirectory
alias cf="cm gcbuild"
alias bu="m6 gcbuild"
alias cfd="cm gcdebug -DCMAKE_BUILD_TYPE=Debug"
alias bud="m6 gcdebug"

# Bob Y's testing: don't turn on netCDF compression, which helps to
# keep file sizes the same, so that they can be diffed in debugging
unset NC_NODEFLATE
export NC_NODEFLATE=y

# Make sure that the stacksize memory is maxed out for OpenMP
export OMP_STACKSIZE=500m

# Manually set the number of OpenMP threads
function set_omp() {
  export OMP_NUM_THREADS=$1
  echo "Number of OpenMP threads: $OMP_NUM_THREADS"
}

#==============================================================================
# %%%%% Personal settings: Git %%%%%
#==============================================================================

# Basic Git commands
alias gui="git gui &"
alias gk="gitk &"
alias gka="gitk --all &"
alias gpo="git pull origin"
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"

# Alias to tell Git to run commands in the CodeDir folder
alias gitc="git -C CodeDir"

# Update the aws-env repository
alias getenv="cd ~/aws-env; git pull origin master"

# For cloning repos from GEOS-Chem Github site
alias clone_gcc="git clone git@github.com:geoschem/GCClassic.git"
alias clone_gchp="git clone git@github.com:geoschem/gchp.git"

# For Git submodules
alias gsu="git submodule update --init --recursive"
alias glog="git -C src/GEOS-Chem log --oneline "
alias hlog="git -C src/HEMCO log --oneline "

# Set a branch to follow a remote branch
function gbup() {
  git branch --set-upstream-to=origin/${1} ${1}
}

# Remove a remote branch
function gbrd() {
  git branch -r -d origin/$1
}

# Remove local and remote branches
function gprune() {
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
