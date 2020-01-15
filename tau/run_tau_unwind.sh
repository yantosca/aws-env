#!/bin/bash

# Script to run GEOS-Chem with TAU instrumentation:
# Uses the unwind function (to provide a deeper dive into function calls)

export TAU_EBS_UNWIND=1
tau_exec -T serial,pthread -ebs ./geos > log 2>&1
