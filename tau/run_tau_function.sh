#!/bin/bash

# Runs GEOS-Chem with TAU instrumentation
# but only provides info at the level of function calls

tau_exec -T serial,pthread -ebs -ebs_resolution=function ./geos > log 2>&1
