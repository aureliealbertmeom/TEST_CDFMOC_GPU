#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=NTASKS
#SBATCH --account hmg2840
#SBATCH --job-name CDFMOC_JOBNAME
#SBATCH -e CDFMOC_JOBNAME.e%j
#SBATCH -o CDFMOC_JOBNAME.o%j
#SBATCH --time=2:00:00
#SBATCH --constraint=HPDA
#SBATCH --exclusive

source ~/.bashrc
load_cray

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/RUN_2026/EXPERIMENT

ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEFILEU u.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEMASK mask.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEMESHH mesh_hgr.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEMESHZ mesh_zgr.nc


/lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFMOC_METHOD/cdfmoc -v u.nc
