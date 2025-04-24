#----------------------------------------------------------------------------
#BOP
#
# !MODULE: .bash_functions
#
# !DESCRIPTION: A .bashrc-style file that you can use to contain your own
#  user-defined bash functions.
#\\
#\\
# !CALLING SEQUENCE:
#  . ~/.bash_functions
#  (will also be called each time you source ~/.bashrc)
#
# !AUTHOR
#  Bob Yantosca (yantosca@seas.harvard.edu), 16 Nov 2022
#
# !REVISION HISTORY:
#  Use the gitk browser to view the revision history!
#EOP
#------------------------------------------------------------------------------
#BOC

#==============================================================================
# %%%%% Bash functions for Git %%%%%
#==============================================================================

function gbup() {
    ###### Set a branch to follow a remote branch #####
    branch=${1/origin\/}
    branch=${branch/upstream\/}
    git branch --set-upstream-to=origin/${branch} ${branch}
}

function gbrd() {
    ###### Remove remote branches #####
    branch=${1/origin\/}
    branch=${branch/upstream\/}

    # Remove branch from origin
    if [ $(git rev-parse --verify origin/$branch 2>/dev/null) ]; then
	git branch -r -d origin/$branch
    fi

    # Remove branch from upstream
    if [ $(git rev-parse --verify upstream/$branch 2>/dev/null) ]; then
	git branch -r -d upstream/$branch
    fi
}

function gprune() {
    ##### Remove local and remote branches #####
    branch=${1/origin\/}
    branch=${branch/upstream\/}

    # Remove local branch
    if [ $(git rev-parse --verify $branch 2>/dev/null) ]; then
	git branch -d $branch
    fi

    # Remove remote branches
    gbrd $branch
}

function gdelrem() {
    ##### Remove a remote branch #####
    branch=${1/origin\/}
    git push origin :${branch}
}

function heads() {
    ##### Print the head commits for each Git submodule #####
    ##### as well as for the superproject folder,       #####
    n_pad=23
    pad="                       "
    baseDir=$(basename $(pwd -P))
    submods=(.)
    submods+=$(grep path "./.gitmodules")
    submods=${submods//path = /}
    for submod in ${submods[@]}; do
	if [[ "x$submod" != "x" ]]; then
	    if [[ -d "${submod}" ]]; then
		head=$(git -C $submod log --oneline -1)
		y=$(basename $submod)
		y=${y/\./${baseDir}}
		y=${y/CodeDir/gchp/}
		echo "${y:0:n_pad}${pad:0:$((n_pad - ${#y}))}: $head"
	    fi
	fi
    done
}

#==============================================================================
# %%%%% Bash functions for Cmake %%%%%
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
    # NOTE: GCHP builds choke when specifying build type
    #cmake ../CodeDir -DCMAKE_BUILD_TYPE=Release -DRUNDIR=".." ${argv}
    cmake ../CodeDir -DRUNDIR=".." ${argv}
    if [[ $? -ne 0 ]]; then
	echo "%%% Failed configuration! %%%"
	cd ${thisDir}
	return 1
    fi

    # Successful return
    echo "%%% Successful configuration! %%%"
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

#==============================================================================
# %%%%% Bash functions for GEOS-Chem %%%%%
#==============================================================================

function set_omp() {
    ##### Manually set the number of OpenMP threads #####
    export OMP_NUM_THREADS=${1}
    echo "Number of OpenMP threads: ${OMP_NUM_THREADS}"
}

function set_log_file() {
    ##### Function to define the GEOS-Chem log file #####
    if [[ "x${1}" == "x" ]]; then
      log=GC.log
    else
      log=GC_${1}.log
    fi
    echo ${log}
}

function gctee() {
    ##### GEOS-Chem run, tee to log #####
    log=$(set_log_file "${1}")
    rm -rf ${log} > /dev/null
    ./gcclassic | tee ${log} 2>&1
}

function gcrun() {
    ##### GEOS-Chem run, pipe to log #####
    log=$(set_log_file "${1}")
    rm -rf ${log} > /dev/null
    ./gcclassic > ${log} 2>&1
}

function gcdry() {
    ##### GEOS-Chem dryrun, pipe to log #####
    log=$(set_log_file "DryRun_${1}")
    rm -rf ${log} > /dev/null
    ./gcclassic --dryrun > ${log}
}

function prepdir() {
    ##### Change group to jacob_gcst and add group write permission #####
    chmod -R g+w $1
    chgrp -R jacob_gcst $1
}

function checkCoards() {
    ##### Checks netCDF files in a folder for COARDS compatibility #####
    for file in ${1}/*.nc*; do
	if [[ -f "${file}" ]]; then
	    isCoards "${file}" > /dev/null
	    echo "$? ${file}"
	fi
    done
}

function gprofout() {
    ##### Directs output from gprofng to a file
    ##### 1st argument: Directory w/ profile output
    ##### 2nd argument: Metric to display (functions, callers, etc)
    echo "${2}" | gprofng display text "${1}" > "${1}-${2}.txt"
}

function vtune_hs_by_line() {
    ##### Make a hotspots report (grouped by line) from VTune output ####
    vtune -report        "hotspots"                 \
	  -result-dir    "${1}"                     \
	  -format        "csv"                      \
          -group-by      "source-line"              \
          -report-output "${1}.hotspots.by-line.csv"
}

function vtune_hs_by_func() {
    ##### Make a hotspots report (grouped by function) from VTune output ####
    vtune -report        "hotspots"                 \
	  -result-dir    "${1}"                     \
	  -format        "csv"                      \
          -group-by      "function"                 \
          -report-output "${1}.hotspots.by-func.csv"
}

#============================================================================
#  %%%%% Bash functions for Pandoc %%%%%
#============================================================================

function mw2md() {
    ##### MediaWiki to MarkDown #####
    base=${1/.mw/}
    pandoc -f mediawiki -t markdown ${base}.mw -o ${base}.md
}

function mw2rst() {
    ##### MediaWiki to MarkDown #####
    base=${1/.mw/}
    pandoc -f mediawiki -t rst ${base}.mw -o ${base}.rst
}

function latex2rst() {
    ##### LateX to ReST #####
    base=${1/.tex/}
    base=${1/.latex/}
    pandoc -f latex -t rest ${base}.mw -o ${base}.rst
}

#==============================================================================
# %%%%% Bash functions for miscellaneous tasks %%%%%
#==============================================================================

function awsagent() {
  ##### Add bmy_aws_keypair.pem to the ssh-agent for Amazon EC2 cloud #####
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/bmy_aws_keypair.pem
}

function dos2unix() {
    ##### Convert a windows file to Unix #####
    awk '{ sub("\r$", ""); print }' ${1} > temp.txt
    mv temp.txt $1 > /dev/null
}

function cm() {
    ##### CMatrix screen saver #####
    cmatrix -as
}

function clean_logs() {
    ##### Removes log and slurm*out files
    rm -f *.log *.out
}

function dos2unix() {
    ##### Convert a windows file to Unix #####
    awk '{ sub("\r$", ""); print }' ${1} > temp.txt
    mv temp.txt $1 > /dev/null
}

#EOC
