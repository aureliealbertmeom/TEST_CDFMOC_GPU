#!/bin/bash

CASE=eNATL60 #eORCA025 #eNATL60 #eORCA025
METHOD=CPU_CRAY #SERIAL_CRAY

case $METHOD in 
	SERIAL_CRAY) NB_TASK=1; QUEUE=HPDA;;
	CPU_CRAY) NB_TASK=128; QUEUE=HPDA;;
	OPENMP_GPU)  QUEUE=MI250;;
esac

case $METHOD in
	SERIAL_CRAY|CPU_CRAY) cp job_HPDA_serial.ksh job_${CASE}-${METHOD}.ksh; sed -i "s/NTASKS/${NB_TASK}/g" job_${CASE}-${METHOD}.ksh;;
	OPENMP_GPU) cp job_MI250.ksh job_${CASE}-${METHOD}.ksh;;
esac

sed -i "s/JOBNAME/${CASE}_${METHOD}/g" job_${CASE}-${METHOD}.ksh
sed -i "s/EXPERIMENT/${CASE}_${METHOD}/g" job_${CASE}-${METHOD}.ksh

case $CASE in
	eNATL60) sed -i "s%CASEFILEU%eNATL60/eNATL60-BLBT02_1h_20090630_20090704_gridV_20090630-20090630.nc%g" job_${CASE}-${METHOD}.ksh; 
		 sed -i "s%CASEMASK%eNATL60/mask_eNATL60_3.6.nc%g" job_${CASE}-${METHOD}.ksh; 
		 sed -i "s%CASEMESHH%eNATL60/mesh_hgr_eNATL60_3.6.nc%g" job_${CASE}-${METHOD}.ksh; 
		 sed -i "s%CASEMESHZ%eNATL60/mesh_zgr_eNATL60_3.6.nc%g" job_${CASE}-${METHOD}.ksh;;
	eORCA05) sed -i "s%CASEFILEU%eORCA05.L121/eORCA05.L121-AAAA009_1h_20120101_20120701_gridV__20120101-20120101.nc%g" job_${CASE}-${METHOD}.ksh;
                 sed -i "s%CASEMASK%eORCA05.L121/eORCA05.L121_mask.nc%g" job_${CASE}-${METHOD}.ksh;
                 sed -i "s%CASEMESHH%eORCA05.L121/eORCA05.L121_mesh_hgr.nc%g" job_${CASE}-${METHOD}.ksh;
                 sed -i "s%CASEMESHZ%eORCA05.L121/eORCA05.L121_mesh_zgr.nc%g" job_${CASE}-${METHOD}.ksh;;
       eORCA025) sed -i "s%CASEFILEU%eORCA025.L75/eORCA025.L75-IMHOTEP.S_y2018m12_1d_gridV.nc%g" job_${CASE}-${METHOD}.ksh;
                 sed -i "s%CASEMASK%eORCA025.L75/mask.nc%g" job_${CASE}-${METHOD}.ksh;
                 sed -i "s%CASEMESHH%eORCA025.L75/mesh_hgr.nc%g" job_${CASE}-${METHOD}.ksh;
                 sed -i "s%CASEMESHZ%eORCA025.L75/mesh_zgr.nc%g" job_${CASE}-${METHOD}.ksh;;
esac

sed -i "s/METHOD/${METHOD}/g" job_${CASE}-${METHOD}.ksh

chmod +x job_${CASE}-${METHOD}.ksh

mkdir -p ${CASE}_${METHOD}

cp job_${CASE}-${METHOD}.ksh ${CASE}_${METHOD}/.

