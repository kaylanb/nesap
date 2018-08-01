# CMSSW

A quick summary: CMSSW is a C++ code that uses Thread Building Blocks (TBB) for multi-threading. Python is used but only for configuration files which tell the compiler which .so files to dynamically link to the base  executable `cmsRun`. You run the code with `cmsRun config.py`. All compiling and building are done using their `scram` tool. Scram, cmsRun, and all cmssw software releases are stored on a LHC file system called `cvmfs`, which supports the entire LHC project so its size is enormous ~ 50+ TB. Technically you could copy the few files you need for cmssw off of cvmfs but that won't be necessary as cvmfs mounts on the Docker image you'll be running. The input and output data files are ROOT which is a hierarchical data storage format with Python packages for reading and writing. 

# Useful Links 

From top to bottom, in order of importance 

**CMS project**

- [CMS github](https://github.com/cms-sw/cmssw/tree/CMSSW_7_5_X)
- [CMS "Workbook"](https://twiki.cern.ch/twiki/bin/view/CMSPublic/WorkBook)
- [scram](  
https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideScram) (their compile, build, and package manager tool)
- [CMS Software Developement Guid](https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuide)
- [Technical Document on the CMS experiment and software (500 pg)](  
http://cdsweb.cern.ch/record/922757/files/lhcc-2006-001.pdf) 

**NESAP**

- [Ian Cosden's VTune + Advisor slides](https://drive.google.com/drive/u/0/folders/0AKaeC40GwofKUk9PVA?ogsrc=32), if that link doesn't work find `VTune_Advisor_Ian_Cosden_2018.pdf` in the NESAP team drive
- [Jonathan Madsen's VTune+Shifter slides](https://docs.google.com/presentation/d/1imZrdx6RaDVLKSkyaFq6VyzNhCharBW5iSUEhusLBDk/edit#slide=id.g3cd7237969_0_8vi )
- [Intel docs on VTune](https://software.intel.com/en-us/articles/optimization-and-performance-tuning-for-intel-xeon-phi-coprocessors-part-2-understanding)

# Collaborators

The head PIs are Dirk Hufnagel (hufnagel@fnal.gov) and Jim Kowalkowski (jbk@fnal.gov), but I primarily emailed and worked with Matti Kortelainen (matti.kortelainen@cern.ch). These were the guys to talk to for the Simulation HCAL project.

The Kalman filter project was Matti and a bunch of other CMS folks. They use this listserv for the project `"mic-trk-rd@cern.ch" <mic-trk-rd@cern.ch>`. Steve Lantz runs their weekly telecon (steve.lantz@cornell.edu). The use `vidyo` for their telecons. Once you download it you can join the call with this link
[https://client-select.web.cern.ch/?url=https%3A%2F%2Fvidyoportal.cern.ch%2Fflex.html%3Froomdirect.html%26key%3DXex6rkoqz8716Tk2iPJo4h91E](https://client-select.web.cern.ch/?url=https%3A%2F%2Fvidyoportal.cern.ch%2Fflex.html%3Froomdirect.html%26key%3DXex6rkoqz8716Tk2iPJo4h91E)


# Projects

We loosely defined two projects. A small self-contained one, envisioned as a warm up, **Simulation HCAL**, and a second one to replace current track reconstruction with a **Kalman filter for reconstruction**

In terms of computing, there is *no need* to have a fermilab or cern account. Of course, you may need a fermilab and/or cern account to access their documentation, for formerly working on the projects as part of the cms collaboration, but don't listen to the docs when they say you need a compute account.

The code for the Simulation HCAL project is here

**simulation HCAL**

- [https://github.com/cms-sw/cmssw/blob/master/RecoLocalCalo/HcalRecProducers/src/HBHEPhase1Reconstructor.cc](https://github.com/cms-sw/cmssw/blob/master/RecoLocalCalo/HcalRecProducers/src/HBHEPhase1Reconstructor.cc)  
- [https://github.com/cms-sw/cmssw/blob/master/RecoLocalCalo/HcalRecAlgos/interface/MahiFit.h](https://github.com/cms-sw/cmssw/blob/master/RecoLocalCalo/HcalRecAlgos/interface/MahiFit.h)  
- [https://github.com/cms-sw/cmssw/blob/master/RecoLocalCalo/HcalRecAlgos/src/MahiFit.cc](https://github.com/cms-sw/cmssw/blob/master/RecoLocalCalo/HcalRecAlgos/src/MahiFit.cc)  
  
Matti, also pointed me to each of these as separate smaller projects if interested

**pixel tracker**  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizer.h](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizer.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizer.cc](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizer.cc)  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizerAlgorithm.h](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizerAlgorithm.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizerAlgorithm.cc](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiPixelDigitizer/plugins/SiPixelDigitizerAlgorithm.cc)  
  
**strip tracker**
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizer.h](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizer.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizer.cc](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizer.cc)  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizerAlgorithm.h](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizerAlgorithm.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizerAlgorithm.cc](https://github.com/cms-sw/cmssw/blob/master/SimTracker/SiStripDigitizer/plugins/SiStripDigitizerAlgorithm.cc)  
  
**ECAL**  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimProducers/interface/EcalDigiProducer.h](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimProducers/interface/EcalDigiProducer.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimProducers/src/EcalDigiProducer.cc](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimProducers/src/EcalDigiProducer.cc)  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimAlgos/interface/EcalTDigitizer.h](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimAlgos/interface/EcalTDigitizer.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimAlgos/interface/EcalTDigitizer.icc](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/EcalSimAlgos/interface/EcalTDigitizer.icc)  
  
**HCAL**  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/interface/HcalDigiProducer.h](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/interface/HcalDigiProducer.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/src/HcalDigiProducer.cc](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/src/HcalDigiProducer.cc)  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/interface/HcalDigitizer.h](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/interface/HcalDigitizer.h)  
- [https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/src/HcalDigitizer.cc](https://github.com/cms-sw/cmssw/blob/master/SimCalorimetry/HcalSimProducers/src/HcalDigitizer.cc)  
  




# Shifter

Grab the CMS docker image.
```
ssh <user>@cori.nersc.gov
shifterimg -v pull docker:bbockelm/cms:rhel6
```
Run shifter from login node
```
shifter --image=bbockelm/cms:rhel6 --module=cvmfs /bin/bash
```
or as an interactive job.
```
# Haswell
salloc -N 1 -C haswell -q interactive --image=bbockelm/cms:rhel6 --module=cvmfs -t 00:30:00
# KNL
salloc -N 1 -C knl -q interactive --image=bbockelm/cms:rhel6 --module=cvmfs -t 00:30:00
# then run shifter
shifter --image=bbockelm/cms:rhel6 --module=cvmfs /bin/bash
```

# Create project "HCAL" and Compile it
HCAL is a standalone simulation reconstruction module. CMS creates "project directories" and we are forced to develop and run code out of it.
```
shifter --image=bbockelm/cms:rhel6 --module=cvmfs /bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
#alias cmsenv='eval `scramv1 runtime -sh`'
#alias cmsrel='scramv1 project CMSSW’
export SCRAM_ARCH=slc6_amd64_gcc630
#cd <workdir>
cd $CSCRATCH/cms
scram project CMSSW_10_1_0
#for versions besides 10_1_0 do
#ls /cvmfs/cms.cern.ch/slc6_amd64_gcc630/cms/cmssw
```
The directory CMSSW_10_0/src is empty. Put the handful of modules from github/cmssw for HCAL in CMSSW_10_0/src using the CMS wrapped git command "git cms-addpkg". Then run scram b from src/ to build the .so files. 
```
cd CMSSW_10_1_0/src
#equivalent to: eval `scramv1 runtime -sh`
cmsenv
git cms-addpkg RecoLocalCalo/HcalRecProducers
git cms-addpkg RecoLocalCalo/HcalRecAlgos
#git cms-addpkg DataFormats/Pat
git cms-addpkg DataFormats
```

## Profilers

This document shows how to use two profiling tools with the Simulation HCAL project. 
 - Intel VTune: hotspots, OpenMP scaling, Cache, Hardware
 - Intel Adviser: vectorization 

Ian Cosden (CMS HPC performance, Princeton) has worked with each of these extensively so would be a good person to collaborate with. 


## Compile for VTune. 

VTune requires that you compile your code with debug symbols, e.g. with the "-g" option. You can edit all of `scram`'s compilation settings  by editing this .xml file located in the directory you created with `scram project <name>`. e.g.,  `
$CSCRATCH/cms/CMSSW_10_1_0/config/toolbox/slc6_amd64_gcc630/tools/selected/gcc-cxxcompiler.xml`. Do the following

 - Add `-g` to `CXXFLAGS`
 - cd $CSCRATCH/cms/CMSSW_10_1_0/src
 - scram setup gcc-cxxcompiler
 - scram b clean
 - scram b -v &> compile_output.txt

Note, the -v prints out all the compilation commands, e.g. so you can check that it compiles how you want for VTune. Also, cms builds with `-O2` by default you might try also `-O3`, 

#### I found that these compile options did not help
- Adding `-g -ftree-vectorizer-verbose=7`, see [here](https://monoinfinito.wordpress.com/series/vectorization-in-gcc/),  to print suggestions for vectorizing loops to the output of scram b 
- Add  `-debug` for inline-debug-info, add b/c the compiler may optimize this away, recommended by Ian Cosden (CMS HPC performance, Princeton)
scram b -v &> compile_output.txt

#### I didn't try these, so might be worthwhile

 - `-O3` instead of `-O2`
	 - Matti recalls from ~8 years ago  that different -Os gave improvement, mainly because (at least with the CPUs of that time) they had an issue with the instruction cache. The CPU spent time idle waiting instructions from the caches+memory because the code is so big.

## Compile for Advisor 

Ian Cosden recommended compiling with `-g -dynamic` but `gcc` does not recognize `-dynamic`, so that must be an `icc` thing

Advisor does not have the same `target-pid` command line option that VTune has, so Jonathan's solution for running VTune on a Docker image does **not** apply to Advisor. is the NERSC Intel contact for VTune. I emailed her and cc'd Rollin asking about whether such an option exists for Advisor. I didn't hear back.

## Warning: aliases

CMS runs a shifter job by executing a script with shifter, then their cmsRun executable gets called in that script. Something like
```
shifter script.sh

# script.sh
source /cvmfs/cms.cern.ch/cmsset_default.sh
...
cmsRun config.py
```
However, any aliases defined in `/cvmfs/cms.cern.ch/cmsset_default.sh` are not preserved (possibly unintended consequence of shifter) so "cmsenv" and "cmsrel" may not be defined.

## Create the Python config file for HCAL

Matti suggested running [runTheMatrix.py](https://github.com/cms-sw/cmssw/blob/CMSSW_7_5_X/Configuration/PyReleaseValidation/scripts/runTheMatrix.py) which uses [cmsDriver.py](https://github.com/cms-sw/cmssw/blob/CMSSW_7_5_X/Configuration/Applications/scripts/cmsDriver.py) to generate a series of config files (step1.py, step2.py, ...) related to HCAL. This is better than running `cmsDriver.py` directly, as the CMS Workbook says to do, because each step can be run as a separate compute tasks. Step3 is HCAL. cmsDriver would merge them all into a single config file. You do `cmsRun stepX.py` for each config file.

```
shifter --image=bbockelm/cms:rhel6 --module=cvmfs /bin/bash
cd $CSCRATCH/cms
git clone https://github.com/cms-sw/cmssw
cd cmssw
python Configuration/PyReleaseValidation/scripts/runTheMatrix.py -l 10824.0 -j 0
```
this makes five config files, HCAL uses the third one. The names of these files are crazy long so rename them
```
cd $CSCRATCH/cms
mv cmssw/10824.0_TTbar_13+TTbar_13TeV_TuneCUETP8M1_2018_GenSimFull+DigiFull_2018+RecoFull_2018+ALCAFull_2018+HARVESTFull_2018 hcal_config
#all .py files except this one has prefix step
#assume this one is step1
mv hcal_config/TTbar_13TeV_TuneCUETP8M1_cfi_GEN_SIM.py hcal_config/step1_cfi_GEN_SIM.py
```

## Compute Jobs at NERSC

These two scripts submit a CMS comput job on NERSC machines

- [job_cms_vtune.slurm](https://github.com/kaylanb/nesap/blob/master/simulation_hcal/job_cms_vtune.slurm) is the batch script
- [job_cms.sh](https://github.com/kaylanb/nesap/blob/master/simulation_hcal/job_cms.sh) is the bash script that shifter runs which ends up running cmsRun on the Simulation HCAL module

Now you'll submit three batch jobs to run steps 1-3. Running each step creates the output ROOT file that the next steps reads as input. Step 3 is the HCAL simulation. 
```
cd $CSCRATCH/cms/rundir
# edit job_cms.slurm and job_cms.sh to run "step1.py"
# cmsRun $config_dir/step1_cfi_GEN_SIM.py
sbatch job_cms.sh
# edit for step 2
# cmsRun $config_dir/step2_DIGI_L1_DIGI2RAW_HLT.py
sbatch job_cms.sh
# edit for step 2
# cmsRun $config_dir/step3_RAW2DIGI_L1Reco_RECO_RECOSIM_EI_PAT_VALIDATION_DQM.py
sbatch job_cms.sh
```
Now that you can run step 3 to completion, let's hook it up to VTune


## Shifter Interactive

A quick note that once you've make your project dir with `scram project <name>`, always being an interactive shifter job by copy and pasting the following
```
shifter --image=bbockelm/cms:rhel6 --module=cvmfs /bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh 
export SCRAM_ARCH=slc6_amd64_gcc630 
cd $CSCRATCH/cms/CMSSW_10_1_0/src
cmsenv
#eval `scramv1 runtime -sh`
```

## VTune

VTune is "shared memory only" so the code you are testing must fall in one of these categories: Serial, OpenMP, or MPI on single node

I got step 2 working before 3, so I'll test out VTune on step 2 for now. Jonathon Madsen figured it out: submit the Shifter job as a background job then run VTune setting `--target-pid=<PID-of-job>`. 
```
ssh <user>@cori.nersc.gov
mkdir $CSCRATCH/cms/rundir/vt
cd vt
module load vtune/2018.up2
sbatch job_cms.slurm

# job_cms.slurm
...
#SBATCH --perf=vtune/2018.up2
...
PID_FILE=$(mktemp pid.XXXXXX)
srun -n 1 -c 68 --cpu_bind=cores shifter $rundir/job_cms.sh & echo $! &> ${PID_FILE}
TARGET_PID=$(cat ${PID_FILE})
amplxe-cl -collect general-exploration -r . -trace-mpi --target-pid=${TARGET_PID}
```
Now lets analyze the output with the VTune GUI. Using NX,
```
cd $CSCRATCH/cms/rundir/vt/vtout.nid02518
module load vtune/2018.up2
amplxe-gui &
```


## What I learned about VTune

- don't use `srun` and `shifter` in the same command because VTune will profile `srun`
- use one dash `-target-pid` not two dashes `--target-pid`
- `-search-dir` provides no additional info to VTune + docker when calling amplexi
- don't use `-tracempi` if using 1 Node
- CMS uses gcc, have they ever tried intel?
- After Googling, there does not appear to be additional compile options besides `-g` when using `gcc` and `VTune`. The worry was that `icc + VTune` gives better output that `gcc + VTune` but that does not sound like it's the case
- gcc versus icc: Matti said, IIRC the Intel compiler has been tested years ago. I don't remember its impact on the performance, but I do recall us having code for which gcc and icc interpret the C++ standard differently. I can also think of bunch of other issues, but for a demonstrated performance improvement I suppose we (CMS) can reconsider.
- which VTune `-collector `should you use? 
	- `general-exploration`, `hotspots`, `hpc-performance` are plenty
	- `memory-consumption`, `disk-io` failed
	- `memory-access` added nothing 
	-  `disk-io` results in the following error from VTune at runtime, google and the postdocs didn't know how to compile code to enable Ftrace
```
amplxe: Warning: Kernel function tracing via ftrace is not available. I/O wait thread state is determenied heuristically. Please recompile the kernel with CONFIG_FUNCTION_TRACER enabled for better results.
amplxe: Error: Ftrace collection is not possible due to a lack of credentials. Make sure you have read/write access to debugFS. You may either run the analysis with root privileges (recommended) or follow the configuration instructions provided in the Software Event Library help topic.
- which VTune GUI `grouping` should you use?
	- See section below, "Results from VTune"

```

## Results from VTune (for config step2.py)

The bottlenecks tend to be .so files where info on the bottleneck function or line number is not available; however, when you do have the option to looking at the source code with VTune the files cannot be found because they are on the Docker image. 
 
the main summary is 
General Exploration/Summary
![enter image description here](https://lh3.googleusercontent.com/Su0__bjNCF597kAizz5owU6VM8_QgIT7bERRrbHYkHd4zWIgGYiaI3W8U69W4UNTrXhtzwukRjde)

Of note is pthreads = 31 which means that a KNL job using all 68 cores will probably perform as well as the same job with only 31 cores

General Exploration/Bottom-up
bottom right "functions only"
This shows only .so files and functions. The .so files dominate the cpu time. The top few are:
 - libFWCoreFramework.so
 - ld.so, linux dynamical object linker
 - libCling.so, c++ library for ROOT data types
 - libpython2.7.so
 ![enter image description here](https://lh3.googleusercontent.com/lkmXk2plEwYD0N9cOQJ_XN73H1z7ug3Oh8jtI3wI892iVPkVXcTO25CXtZ-PHJsiOTZLq_lxltMm)
 
None of these besides python2.7.so can be improved. However, I remember reading and hearing about speedups of 10-25% by people simply using python3 instead of python2

HPC Performance Characteristics/Bottom-up
enlarge panel on far right. 
![enter image description here](https://lh3.googleusercontent.com/jP2HAhPYxaZQX-2L5DWX3HFopvvlvAXWebairlqAZej1h3N3Iupgp2XFxmgsCJ1NYPNh2lzhbI80)
Key numbers are
 - L2 Hit 7%, Miss 8% 
- SIMD packed 40%, Scalar 60%

L2 Hit is the fraction of cycles spent on getting data from L2 cache, while Miss is the fraction of cycles used getting data when it isn't found on L2. Is 5% small?

SIMD Instr is how packed the 512-bit vector processing units are. e.g. they are 40% and 60% full. Vectorization should help the code.

Now, lets look for costly loops. Set "grouping" to `Source Function/Function/Call Stack` and go to
General Exploration/Hotspots
on bottom right select loops only:
![enter image description here](https://lh3.googleusercontent.com/_F8xYATypBnocwZrIwVnQno5_Z6KBZ1LnGhra8QzSQsLKBjEcE7mv_pIXR5Nc5X4h7jZmtPLO3bw)
- but 99.9% of the time apparently occurs outside any loop 

General Exploration/Hotspots
on bottom right select "functions & loops"
then pull up lower panel 
![enter image description here](https://lh3.googleusercontent.com/7IZLyL-_zhD3xwrc001mgxQvsNOSQysDs_-Ix2HTCij_PJgN35UWVau3gwJuQIpZYverlC4MtAMy)
brown: good, orange: bad, green: idle
- agrees with above, all but 1 thread is doing work, one module or file consuming all the time

## Intel Adviser --> vectorization tuning

Ian Cosden's recommended tuner for vectorization in CMS.


# Conclusions

There scripts on my github, as shown above, run VTune on your own compiled cms module and the VTune output is complete enough that you can look at individual files and specific line numbers for bottlenecks. However, the fundamental problem is that 99% of the time is spent in the cms FrameWork .so file called `libFWCoreFramework.so`, which VTune cannot see into. 

For example,
General Exploration/Bottom-up
bottom right "functions only" ![enter image description here](https://lh3.googleusercontent.com/lkmXk2plEwYD0N9cOQJ_XN73H1z7ug3Oh8jtI3wI892iVPkVXcTO25CXtZ-PHJsiOTZLq_lxltMm)
 

Rollin and I think that the `cmsRun` executable is not compiled with the `-g` debug symbols flag, so VTune cannot profile `libFWCoreFramework.so`. We are "supposed" to use the pre-built `cmsRun` stored in the `cvmfs` module, but the next step in this project is the figure out how to build `cmsRun` ourselves with `-g`. I asked Matti about this a few weeks ago and everyone simply uses `cmsRun` and doesn't build it. So another expert is probably needed for this part. Maybe Wahid or Lisa know enough to team up to do this.  

The code for cmsRun is here
- [https://github.com/cms-sw/cmssw/blob/master/FWCore/Framework/bin/cmsRun.cpp](https://github.com/cms-sw/cmssw/blob/master/FWCore/Framework/bin/cmsRun.cpp)

Beyond that, figuring out how to run Advisor on a Docker image (remember, `-target-pid` is not an option in Advisor so Jonathon's VTune + Docker solution does not work) is the next step for improving vectorization.  And it looks like vectorization would improve things by a factor of ~ 2 as the SIMD instructions are half packed.

For example, 
HPC Performance Characteristics/Bottom-up
enlarge panel on far right. 
![enter image description here](https://lh3.googleusercontent.com/jP2HAhPYxaZQX-2L5DWX3HFopvvlvAXWebairlqAZej1h3N3Iupgp2XFxmgsCJ1NYPNh2lzhbI80)

