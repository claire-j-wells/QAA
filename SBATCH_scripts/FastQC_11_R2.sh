#!/bin/bash

#SBATCH --job-name=11_R2
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50G
#SBATCH --nodes=1
#SBATCH --output=slurm-R3-%j.out
#SBATCH --error=slurm-R3-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL

/usr/bin/time -v fastqc -o FastQC_11_out/R2_11 -t 1 /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R2_001.fastq.gz

exit
