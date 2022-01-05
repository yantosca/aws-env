#!/bin/bash

# Set paths to the ref & dev directories
refdir=/local/ryantosca/GC/rundirs/epa-kpp/ref_epa
devdir=/local/ryantosca/GC/rundirs/epa-kpp/dev_epa

# Update filenames as necessary
files=(                              \
GEOSChem.Restart.20190701_0000z.nc4  \
input.geos                           \
HEMCO_Config.rc                      \
HEMCO_Diagn.rc                       \
HISTORY.rc                           \
species_database.yml                 \
)

# Loop over files
for file in ${files[@]}; do

    # Remove each file in the ref dir
    rm -vf ${refdir}/${file}

    # Link to the file in the dev dir
    ln -vs ${devdir}/${file} ${refdir}/${file}

done

# Quit
exit 0
