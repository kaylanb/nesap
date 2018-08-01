#!/bin/bash -l
#SBATCH -A nstaff
#SBATCH -q debug
#SBATCH -C knl,quad,cache
#SBATCH -t 00:30:00
#SBATCH -L SCRATCH
#SBATCH --image=docker:bbockelm/cms:rhel6 
#SBATCH --module=cvmfs
#SBATCH --perf=vtune/2018.up2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 68


####SBATCH --volume="/global/cscratch1/sd/kaylanb/cms/cmssw/node_cache:/tmp:perNodeCache=size=1380G"

export rundir=/global/cscratch1/sd/kaylanb/cms/rundir/vt

# file we will store PID in -- cannot directly export to ENV variable
PID_FILE=$(mktemp pid.XXXXXX)
#VTUNE_DIR=$(mktemp -d vtout_XXXXX)
#srun -n 1 -c 68 --cpu_bind=cores shifter $rundir/job_cms.sh & echo $! &> ${PID_FILE} 
shifter $rundir/job_cms.sh & echo $! &> ${PID_FILE} 
TARGET_PID=$(cat ${PID_FILE})
# run VTune attach to PID
# jmadsen says to "do" finalization for KNL if shifter + VTune
# e.g. don't use these: finalizaIon-mode=none or -no-auto-finalize


## Collect
## `hotspots`, `hpc-performance`, `io`, `memory-access`, `memory-consumption`
#amplxe-cl -collect general-exploration -r vt_no-search-dir -target-pid=${TARGET_PID}
#amplxe-cl -collect memory-consumption -r vt_no-search-dir-memory-consumption -target-pid=${TARGET_PID}
## Other
#amplxe-cl -collect general-exploration -r vt_no-search-dir-trace-mpi -trace-mpi -target-pid=${TARGET_PID}
amplxe-cl -collect general-exploration -r vt_-g-debug -target-pid=${TARGET_PID} 
#bin:= /cvmfs/cms.cern.ch/slc6_amd64_gcc630/cms/cmssw/CMSSW_10_1_0/bin/slc6_amd64_gcc630/cmsRun
