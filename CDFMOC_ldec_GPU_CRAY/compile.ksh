#!/bin/bash

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFMOC_ldec_GPU_CRAY

source ~/.bashrc
load_cray_gpu
make clean
make
