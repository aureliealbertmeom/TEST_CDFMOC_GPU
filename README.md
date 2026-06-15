# TEST_CDFMOC_GPU

We want to test the porting of [CDFTOOL](https://github.com/meom-group/CDFTOOLS) [cdfmoc](https://github.com/meom-group/CDFTOOLS/blob/master/src/cdfmoc.f90) on GPU .
This library computes the Meridional Overturning Cell (MOC) from a given meridional velocity field (V). The computation involves a zonal integration and a vertical integration from bottom to surface.
It already has some OpenMP directives in it that we translated to GPU offloading.

3 test cases involving 3 different simulation outputs have been designed :
  - eORCA05 : XxYxZxT = 722x604x121x18=950M pt (53M pt/dt)
  - eORCA025 : XxYxZxT = 1442x1207x75x31=4B pt (130M pt/dt)
  - eNATL60 : XxYxZxT = 8354x4729x300x24=284B pt (12B pt/dt)

We used the cray compilers and compiled the fortran code first without the openMP option (SERIAL) that we ran on a HPDA core , with OpenMP (CPU) that we ran on a whole HPDA node (128 cores) and with GPU offloading (GPU) that we ran on a whole MI250 node

cdfmoc total :

| TEST_CASE | RUN IN SERIAL | RUN ON CPU (128cores)| RUN ON CPU (256 cores) | RUN ON GPU |
|----------|---------------|-------------|-----------|---|
| eORCA05 | 49 sec | 55 sec (x1.12) | | 80 sec (x1.6) |
| eORCA025 | 91 sec | 94 sec (x1.03)| | 161 sec (x1.8) |
| eNATL60 | 74 min | 74 min (x1) | 76 min | 294 min (x4) |

cdfmoc decomposition (calls sigmai from eos and needs extra T files) :

| TEST_CASE | RUN IN SERIAL | RUN ON CPU (128cores)| RUN ON CPU (256 cores) | RUN ON GPU |
|----------|---------------|-------------|-----------|---|
| eORCA05 | 210 sec | 224 sec | | 249 sec |
| eORCA025 | 524 sec | 576 sec | | 666 sec |
| eNATL60 | |  |  | |

cdfmoc total without writing data and 1 time-step only :

| TEST_CASE | RUN IN SERIAL | RUN ON CPU (128cores)| RUN ON CPU (256 cores) | RUN ON GPU |
|----------|---------------|-------------|-----------|---|
| eORCA05 | 10 sec | 14 sec (x1.4) | | 20 sec (x2) |
| eORCA025 | 12 sec | 16 sec (x1.3) | | 21 sec (1.75) |
| eNATL60 | 21 min | 20 min | 20 min | 32 min |

cdfspice :

| TEST_CASE | RUN IN SERIAL | RUN ON CPU (128cores)| RUN ON CPU (256 cores) | RUN ON GPU |
|----------|---------------|-------------|-----------|---|
| eORCA05 | 72 sec | 66 sec | | 298 sec |
| eORCA025 | | | | |
| eNATL60 | |  |  | |

cdfspice without writing data and 1 time-step only :

| TEST_CASE | RUN IN SERIAL | RUN ON CPU (128cores)| RUN ON CPU (256 cores) | RUN ON GPU |
|----------|---------------|-------------|-----------|---|
| eORCA05 | 10 sec | 10 sec | | 27 sec |
| eORCA025 | 227 sec | 148 sec | | 572 sec |
| eNATL60 | 412 sec | 406 sec | 388 sec | 900 sec |
