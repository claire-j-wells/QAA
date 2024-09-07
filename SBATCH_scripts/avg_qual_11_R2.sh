#!/bin/bash

#SBATCH --job-name=R2_11_qual
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH -c 8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=slurm_outputs/avg_qual/R2_11_qual-%j.out
#SBATCH --error=slurm_outputs/avg_qual/R2_11_qual-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL


conda activate bgmp_py312

/usr/bin/time -v ./avg_qual.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R2_001.fastq.gz -len 101 -o Average_Quality_Scores_Sample_11_R2

exit 