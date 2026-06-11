# Makefile for CDFTOOLS_3.0

# ( make.macro is a link that points to the file macro.xxx where 
#   xxx is representative of your machine )
# !!----------------------------------------------------------------------
# !! CDFTOOLS_3.0 , MEOM 2011
# !! $Id$
# !! Copyright (c) 2010, J.-M. Molines
# !! Software governed by the CeCILL licence (Licence/CDFTOOLSCeCILL.txt)
# !!----------------------------------------------------------------------

include make.macro

BINDIR = .

VPATH = $(BINDIR)

EXEC = cdfmoc

.PHONY: all help clean cleanexe install man installman zclass_list.txt

all: $(EXEC)

help:
	@echo "#-------------------------------------------------"
	@echo "# List of make targets:"
	@echo "#  all          : build cdftools binary"
	@echo "#  man          : build manual"
	@echo "#  clean        : remove building object (.o, .mod...)"
	@echo "#  cleanexe     : remove binary executable"
	@echo "#  install      : install binary in INSTALL folder"
	@echo "#  installman   : install manual in INSTALL_MAN folder"
	@echo "#-------------------------------------------------"

cdfmoc: cdfio.o  eos.o cdftools.o cdfmoc.f90
	$(F90)  cdfmoc.f90 -o $(BINDIR)/cdfmoc cdfio.o eos.o modcdfnames.o cdftools.o $(FFLAGS)

cdfio.o: cdfio.F90 modcdfnames.o
	$(F90) -c  cdfio.F90 $(FFLAGS)

eos.o: eos.f90
	$(F90)  -c eos.f90 $(FFLAGS)

modcdfnames.o: modcdfnames.F90 modcdfnames_CMIP6.h90
	$(F90) -c modcdfnames.F90 $(FFLAGS)

cdftools.o: cdfio.o cdftools.f90
	$(F90) -c cdftools.f90 $(FFLAGS)

## Utilities
clean:
	\rm -f *.mod *.o  *~ *.1 *.opod

cleanexe: clean
	( cd $(BINDIR) ; \rm -f $(EXEC) )

