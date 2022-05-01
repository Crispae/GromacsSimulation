#!/bin/bash

#SBATCH --job-name=mdrun_test
#SBATCH --nodes=4
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=ta059
#SBATCH --partition=standard
#SBATCH --qos=standard

# Setup the environment
module load gromacs

export OMP_NUM_THREADS=1 
srun --distribution=block:block --hint=nomultithread gmx_mpi mdrun -deffnm nvt
