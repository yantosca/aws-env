#!/bin/bash

#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !IROUTINE: run_20m.sh
#
# !DESCRIPTION: Updates default configuration file settings to the proper
#  settings for 20-minute simulation (one chemical timestep)
#
# !CALLING SEQUENCE:
#  run_20m.sh /path/to/run/directory
#
# !REVISION HISTORY:
#  See the subsequent Git history with the gitk browser!
#EOP
#------------------------------------------------------------------------------
#BOC

# Change config file settings to be a 20-minute run
if [[ "x${1}" != "x" ]]; then
    cd ${1}
fi

# Get the current folder
cwd=$(pwd -P)

# Replace ending time in input.geos
sed -i -e "s/20190801 000000/20190701 002000/" input.geos

# Replace freq & duration in HISTORY.rc
sed -i -e "s/00000100 000000/00000000 002000/" HISTORY.rc

# Set diagnostic frequency to End in HEMCO_Config.rc
sed -i -e "s/DiagnFreq:                   Monthly/DiagnFreq:                   End/" HEMCO_Config.rc

#EOC
