#!/bin/bash

#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !IROUTINE: run_1h.sh
#
# !DESCRIPTION: Updates default configuration file settings to the proper
#  settings for a 1hr simulation.
#
# !CALLING SEQUENCE:
#  run_1h.sh /path/to/run/directory
#
# !REVISION HISTORY:
#  See the subsequent Git history with the gitk browser!
#EOP
#------------------------------------------------------------------------------
#BOC

# If a directory is supplied, navigate to it
if [[ "x${1}" != "x" ]]; then
    cd ${1}
fi

# Get the current folder
cwd=$(pwd -P)

# Replace ending time in input.geos
sed -i -e "s/20190801 000000/20190701 010000/" input.geos

# Replace freq & duration in HISTORY.rc
sed -i -e "s/00000100 000000/00000000 010000/" HISTORY.rc

# Set diagnostic frequency to End in HEMCO_Config.rc
sed -i -e "s/DiagnFreq:                   Monthly/DiagnFreq:                   End/" HEMCO_Config.rc

#EOC
