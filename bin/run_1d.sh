#!/bin/bash

#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !IROUTINE: run_1d.sh
#
# !DESCRIPTION: Updates default configuration file settings to the proper
#  settings for a 2-day simulation (one chemical timestep)
#
# !CALLING SEQUENCE:
#  run_20m.sh /path/to/run/directory
#
# !REVISION HISTORY:
#  See the subsequent Git history with the gitk browser!
#EOP
#------------------------------------------------------------------------------
#BOC

# Change config file settings to be a 1-day run
if [[ "x${1}" != "x" ]]; then
    cd ${1}
fi

# Get the current folder
cwd=$(pwd -P)

# Replace ending time in input_options.yml
sed -i -e "s/20190801, 000000/20190702, 000000/" geoschem_config.yml
sed -i -e "s/20160801, 000000/20160702, 000000/" geoschem_config.yml
sed -i -e "s/20130801, 000000/20130702, 000000/" geoschem_config.yml
sed -i -e "s/20190201, 000000/20190102, 000000/" geoschem_config.yml
sed -i -e "s/20160201, 000000/20160102, 000000/" geoschem_config.yml
sed -i -e "s/20130201, 000000/20130102, 000000/" geoschem_config.yml

# Replace freq & duration in HISTORY.rc
sed -i -e "s/00000100 000000/00000001 000000/" HISTORY.rc

# Set diagnostic frequency to End in HEMCO_Config.rc
sed -i -e "s/DiagnFreq:                   Monthly/DiagnFreq:                   End/" HEMCO_Config.rc

#EOC
