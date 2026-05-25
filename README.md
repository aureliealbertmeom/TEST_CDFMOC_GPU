# TEST_CDFMOC_GPU

We want to test the porting of [CDFTOOL](https://github.com/meom-group/CDFTOOLS) [cdfmoc](https://github.com/meom-group/CDFTOOLS/blob/master/src/cdfmoc.f90) on GPU .
This library computes the Meridional Overturning Cell (MOC) from a given meridional velocity field (V). The computation involves a zonal integration and a vertical integration from bottom to surface.
It already has some OpenMP directives in it that we translated to GPU offloading.

3 test cases involving 3 different simulation outputs have been designed :
  - eORCA05 : XxYxZxT = 722x604x121x18
  - eORCA025 : XxYxZxT = 1442x1207x75x31
  - eNATL60 : XxYxZxT = 8354x4729x300x24

We used the cray compilers and compiled the fortran code first without the openMP option (SERIAL) that we ran on a HPDA core , with OpenMP (CPU) that we ran on a whole HPDA node (128 cores) and with GPU offloading (GPU) that we ran on a whole MI250 node

| TEST_CASE | RUN IN SERIAL | RUN ON CPU | RUN ON GPU |
|----------|---------------|-------------|-----------|
| eORCA05 | 49 sec | 55 sec | 80 sec |
| eORCA025 | 91 sec | 94 sec | 161 sec |
| eNATL60 | 74 min | 74 min | |
