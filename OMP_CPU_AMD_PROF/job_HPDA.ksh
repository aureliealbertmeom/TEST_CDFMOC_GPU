#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=128
#SBATCH --account hmg2840
#SBATCH --job-name "cdfmoc_omp_cpu"
#SBATCH --time=6:00:00
#SBATCH --constraint=HPDA
#SBATCH --exclusive

source ~/.bashrc
load_amd_cpu

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lus/home/softs/intel/oneapi/compiler/2022.1.0/linux/compiler/lib/intel64_lin

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/OMP_CPU_AMD
cdfmoc -v eNATL60-BLBT02_1h_20090630_20090704_gridV_20090630-20090630.nc
