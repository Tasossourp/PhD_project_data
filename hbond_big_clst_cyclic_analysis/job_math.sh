#!/bin/bash

#SBATCH -J hbonds          # Job name
#SBATCH -o hbonds_test.out   # Specify stdout output file (%j expands to jobId)
#SBATCH -p bigmem              # Partition/Queue name
#SBATCH -C skylake               # select 'skylake' architecture
#SBATCH -N 1                     # Total number of nodes requested (32 cores/node)
#SBATCH -t 72:00:00              # Run time (hh:mm:ss) - 0.5 hours
 
#SBATCH -A m2_trr146           # Specify allocation to charge against

#SBATCH --array=0-5
#SBATCH --ntasks=1 
#SBATCH --mail-user=asourpis@uni-mainz.de
#SBATCH --mail-type=ALL

 
# Load all necessary modules if needed (these are examples)
# Loading modules in the script ensures a consistent environment.
module load bio/GROMACS/2018.1-intel-2018.02
module load bio/Chimera/1.16-linux_x86_64
module load math/Mathematica/12.2.0

declare -a elfields
elfields=(1 2 3 4 5 6)
export ef=${elfields[${SLURM_ARRAY_TASK_ID}]}

#srun workflow_hbonds.sh &&
math -script cycles_1stclass_1e-$ef.wls


#echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID


#export ef=${elfields[1]}
#srun dipoles.sh
