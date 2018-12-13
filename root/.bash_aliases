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

# Override the default Unix prompt
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

# Bob Y's testing: don't turn on netCDF compression, which helps to
# keep file sizes the same, so that they can be diffed in debugging
unset NC_NODEFLATE
export NC_NODEFLATE=y

# Call ncdump and pipe the result to less
function ncd() {
  /usr/bin/ncdump -cts $1 | less
}

# Convert a windows file to Unix
function dos2unix() {
  awk '{ sub("\r$", ""); print }' $1 > $2
}

# GCHP convenience aliases
alias mco="make cleanup_output"
alias mcs="make compile_standard"
alias run6="mpirun -np 6 ./geos > gchp.log 2>&1 &"
function rungchp() {
  mpirun -np $1 ./geos | tee gchp.log
}

# Tmux aliases
alias tmuxnew="tmux new -s "
alias tmuxat="tmux a -t "
alias tmuxde="tmux detach "

#==============================================================================
# %%%%% Personal settings: Git commands %%%%%
#==============================================================================

# Basic Git commands
alias gui="git gui &"
alias gk="gitk &"
alias gka="gitk --all &"
alias gpo="git pull origin"
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log --pretty=format:'%h : %s' --topo-order --graph"
alias getenv="cd ~/env; git pull origin master"
alias update_tags="git tag -l | xargs git tag -d && git fetch -t"

# Update the aws-env repository
alias getenv="cd ~/aws-env; git pull origin master"

# For cloning repos from GEOS-Chem Github site
alias clone_gc="git clone git@github.com:geoschem/geos-chem.git"
alias clone_gchp="git clone git@github.com:geoschem/gchp.git"
alias clone_ut="git clone git@github.com:geoschem/geos-chem-unittest.git"
alias clone_nc="git clone git@github.com:geoschem/ncdfutil.git"

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
alias jup="jupyter notebook"
alias jup_port="jupyter notebook --port 8899"

# Select Bob Y's custom environment
alias sab="source activate bmy"
alias sdb="source deactivate"
export PATH=$PATH:/home/miniconda/bin:$PATH

# Add Python repos to $PYTHONPATH
#export PYTHONPATH=$PYTHONPATH:/home/python/gcpy

#EOC
