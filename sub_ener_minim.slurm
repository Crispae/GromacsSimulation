#!/bin/bash

#SBATCH --job-name=mdrun_ene_min
#SBATCH --nodes=4
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:20

#SBATCH --account=ta059
#SBATCH --partition=standard
#SBATCH --qos=standard

module load gromacs

export OMP_NUM_THREADS=1
srun --distribution=block:block --hint=nomultithread gmx_mpi mdrun -v -s em.tpr

