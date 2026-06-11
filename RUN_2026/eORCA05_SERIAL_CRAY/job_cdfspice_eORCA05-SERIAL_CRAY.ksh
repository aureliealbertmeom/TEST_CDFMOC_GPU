#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --account hmg2840
#SBATCH --job-name CDFSPICE_eORCA05_SERIAL_CRAY
#SBATCH -e CDFSPICE_eORCA05_SERIAL_CRAY.e%j
#SBATCH -o CDFSPICE_eORCA05_SERIAL_CRAY.o%j
#SBATCH --time=2:00:00
#SBATCH --constraint=HPDA

source ~/.bashrc
load_cray

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/RUN_2026/eORCA05_SERIAL_CRAY

ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA05.L121/eORCA05.L121-AAAA009_1h_gridT__20120101-20120101.nc t.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA05.L121/eORCA05.L121_mask.nc mask.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA05.L121/eORCA05.L121_mesh_hgr.nc mesh_hgr.nc
ln -sf /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/TEST_CASES/eORCA05.L121/eORCA05.L121_mesh_zgr.nc mesh_zgr.nc


/lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFSPICE_SERIAL_CRAY/cdfspice -t t.nc
