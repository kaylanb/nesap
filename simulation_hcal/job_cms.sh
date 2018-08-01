#!/bin/bash

# CMSSW architecture we are using
# production archs depend on release
export SCRAM_ARCH=SCRAM_ARCH=slc6_amd64_gcc630

# setup basic CMS environment
source /cvmfs/cms.cern.ch/cmsset_default.sh
# WARNING aliases are not preserved
# so 
#alias cmsenv='eval `scramv1 runtime -sh`'
#alias cmsrel='scramv1 project CMSSW'
#Not available

echo PATH $PATH
# might be easier to put this on scratch to start with
# can have performance problems, NodeCache works better
#export DATADIR=/tmp

# only needed if the job reads data remotely from CMS site
# you can generate a long-lifed proxy on lxplus and copy it here
#export X509_USER_PROXY=/global/homes/h/hufnagel/test_cmssw10/myproxy.pem

export src_dir=$CSCRATCH/cms/CMSSW_10_1_0/src
export config_dir=$CSCRATCH/cms/hcal_config
export run_dir=$CSCRATCH/cms/rundir


# Setup CMSSW runtime environment
cd $src_dir
pwd
echo src_dir $src_dir
echo run_dir $run_dir
#cmsenv
eval `scramv1 runtime -sh`
#where run code from
cd $run_dir

date
#cmsRun $config_dir/step1_cfi_GEN_SIM.py 
cmsRun $config_dir/step2_DIGI_L1_DIGI2RAW_HLT.py
#cmsRun $config_dir/step3_RAW2DIGI_L1Reco_RECO_RECOSIM_EI_PAT_VALIDATION_DQM.py
date

