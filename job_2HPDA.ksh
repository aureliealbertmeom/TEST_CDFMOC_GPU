#!/bin/bash

#SBATCH --nodes=2
#SBATCH --ntasks=256
#SBATCH -A hmg2840
#SBATCH -e plot.e%j
#SBATCH -o plot.o%j
#SBATCH --time=6:00:00
#SBATCH --constraint=HPDA
#SBATCH --exclusive

cdfmoc -v eNATL60-BLBT02_1h_20090630_20090704_gridV_20090630-20090630.nc
