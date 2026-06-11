#!/bin/bash

cd /lus/work/CT1/hmg2840/aalbert/TEST_CDFMOC_GPU/CDFSPICE_SERIAL_CRAY

source ~/.bashrc
load_cray
make clean
make
