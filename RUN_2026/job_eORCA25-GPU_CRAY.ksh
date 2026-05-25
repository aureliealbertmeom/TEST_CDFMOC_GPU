#!/bin/bash

#SBATCH --nodes=1
#SBATCH --account hmg2840
#SBATCH --job-name CDFMOC_eORCA25_GPU_CRAY
#SBATCH -e CDFMOC_eORCA25_GPU_CRAY.e%j
#SBATCH -o CDFMOC_eORCA25_GPU_CRAY.o%j
#SBATCH --time=2:00:00
#SBATCH --constraint=MI250
#SBATCH --exclusive

source ~/.bashrc
load_cray_gpu

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/RUN_2026/eORCA25_GPU_CRAY

ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEFILEU u.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEMASK mask.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEMESHH mesh_hgr.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/CASEMESHZ mesh_zgr.nc


/lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFMOC_GPU_CRAY/cdfmoc -v u.nc
