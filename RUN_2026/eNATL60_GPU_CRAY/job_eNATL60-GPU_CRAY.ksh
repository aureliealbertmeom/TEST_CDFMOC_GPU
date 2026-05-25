#!/bin/bash

#SBATCH --nodes=1
#SBATCH --account hmg2840
#SBATCH --job-name CDFMOC_eNATL60_GPU_CRAY
#SBATCH -e CDFMOC_eNATL60_GPU_CRAY.e%j
#SBATCH -o CDFMOC_eNATL60_GPU_CRAY.o%j
#SBATCH --time=8:00:00
#SBATCH --constraint=MI250
#SBATCH --exclusive

source ~/.bashrc
load_cray_gpu

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/RUN_2026/eNATL60_GPU_CRAY

ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eNATL60/eNATL60-BLBT02_1h_20090630_20090704_gridV_20090630-20090630.nc u.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eNATL60/mask_eNATL60_3.6.nc mask.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eNATL60/mesh_hgr_eNATL60_3.6.nc mesh_hgr.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eNATL60/mesh_zgr_eNATL60_3.6.nc mesh_zgr.nc


/lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFMOC_GPU_CRAY/cdfmoc -v u.nc
