#!/bin/sh

cd /home/ikalash/nightlyCDashNewCDash


export PATH=$PATH:/usr/lib64/openmpi/bin:/home/ikalash/Install/ParaView-4.3.1-Linux-64bit/bin:/home/ikalash/Install:/home/ikalash/Install/Cubit:/home/ikalash/Install/R2015a/bin:/home/ikalash/nightlyAlbanyTests/Results/Trilinos/build/install

export LD_LIBRARY_PATH=/usr/lib64:/usr/lib64/openmpi/lib

#unset http_proxy
#unset https_proxy

export https_proxy="https://wwwproxy.ca.sandia.gov:80"
export http_proxy="http://wwwproxy.ca.sandia.gov:80"

now=$(date +"%m_%d_%Y-%H_%M")
#LOG_FILE=/projects/AppComp/nightly/cee-compute011/nightly_$now
LOG_FILE=/home/ikalash/nightlyCDashNewCDash/nightly_logT.txt

eval "env  TEST_DIRECTORY=/home/ikalash/nightlyCDashNewCDash SCRIPT_DIRECTORY=/home/ikalash/nightlyCDashNewCDash ctest -VV -S /home/ikalash/nightlyCDashNewCDash/ctest_nightly_albanyT.cmake" > $LOG_FILE 2>&1

# Copy a basic installation to /projects/albany for those who like a nightly
# build.
#cp -r build/TrilinosInstall/* /projects/albany/trilinos/nightly/;
#chmod -R a+X /projects/albany/trilinos/nightly;
#chmod -R a+r /projects/albany/trilinos/nightly;
