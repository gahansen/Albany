#!/bin/csh

BASE_DIR=/home/projects/albany/nightlyCDashTrilinosBlake
cd $BASE_DIR

rm -rf build
rm -rf repos 
rm -rf *log*
rm -rf results_blake_serial
rm -rf ctest_nightly.cmake 
rm -rf modules.out 

unset http_proxy
unset https_proxy

export OMP_NUM_THREADS=1
export INTEL_LICENSE_FILE=/home/projects/x86-64/intel/licenses/USE_SERVER-ohpc.lic
source blake_intel_modules.sh >& modules.out  

LOG_FILE=$BASE_DIR/nightly_log_blakeTrilinosSerial.txt

eval "env  TEST_DIRECTORY=$BASE_DIR SCRIPT_DIRECTORY=$BASE_DIR ctest -VV -S $BASE_DIR/ctest_nightly_trilinos_serial.cmake" > $LOG_FILE 2>&1

