#!/bin/bash

if [ -f ./CMakeCache.txt ]; then
    rm CMakeCache.txt
fi

# The Trilinos Dir is the same as the PREFIX entry from the
# Trilinos configuration script

cmake \
 -D ALBANY_TRILINOS_DIR:FILEPATH=$REMOTE/trilinos-install-gcc-release \
 -D CMAKE_CXX_FLAGS:STRING="-msse3 -DNDEBUG" \
 -D CMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
 -D ENABLE_LCM:BOOL=ON \
 -D ENABLE_ATO:BOOL=OFF \
 -D ENABLE_QCAD:BOOL=OFF \
 -D ENABLE_MOR:BOOL=OFF \
 -D ENABLE_SG:BOOL=OFF \
 -D ENABLE_ENSEMBLE:BOOL=OFF \
 -D ENABLE_FELIX:BOOL=OFF \
 -D ENABLE_LAME:BOOL=OFF \
 -D ENABLE_LAMENT:BOOL=OFF \
 -D ENABLE_CHECK_FPE:BOOL=OFF \
 -D ENABLE_FLUSH_DENORMALS:BOOL=OFF \
 -D ENABLE_KOKKOS_UNDER_DEVELOPMENT:BOOL=OFF \
 -D ALBANY_ENABLE_FORTRAN:BOOL=OFF \
 -D ENABLE_SLFAD:BOOL=OFF \
  \
 $REMOTE/src/Albany
