#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account hmg2840
#SBATCH --job-name "cdfmoc_omp_cpu"
#SBATCH --time=6:00:00
#SBATCH --constraint=HPDA
#SBATCH --mem=50Gb

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/SERIAL_CPU
cdfmoc -v eNATL60-BLBT02_1h_20090630_20090704_gridV_20090630-20090630.nc
