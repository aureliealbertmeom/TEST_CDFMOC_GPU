#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=128
#SBATCH --account hmg2840
#SBATCH --job-name CDFMOC_eORCA025_CPU_CRAY
#SBATCH -e CDFMOC_eORCA025_CPU_CRAY.e%j
#SBATCH -o CDFMOC_eORCA025_CPU_CRAY.o%j
#SBATCH --time=2:00:00
#SBATCH --constraint=HPDA
#SBATCH --exclusive

source ~/.bashrc
load_cray

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/RUN_2026/eORCA025_CPU_CRAY

ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA025.L75/eORCA025.L75-IMHOTEP.S_y2018m12_1d_gridV.nc u.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA025.L75/mask.nc mask.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA025.L75/mesh_hgr.nc mesh_hgr.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA025.L75/mesh_zgr.nc mesh_zgr.nc


/lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFMOC_CPU_CRAY/cdfmoc -v u.nc
