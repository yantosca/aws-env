#!/bin/bash

# Script for profiling GEOS-Chem: default values

tau_exec -T serial,pthread -ebs ./geos > log 2>&1
