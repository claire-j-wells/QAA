#!/bin/bash

#SBATCH --job-name=R2_C_qual
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50G
#SBATCH --nodes=1
#SBATCH --output=slurm_outputs/avg_qual/R2_C_qual-%j.out
#SBATCH --error=slurm_outputs/avg_qual/R2_C_qual-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL


conda activate bgmp_py312

/usr/bin/time -v ./avg_qual.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz -len 101 -o Average_Quality_Scores_Control_R2

exit 