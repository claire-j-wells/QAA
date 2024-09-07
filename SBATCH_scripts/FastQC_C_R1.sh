#!/bin/bash

#SBATCH --job-name=R1_C
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50G
#SBATCH --nodes=1
#SBATCH --output=slurm-R3-%j.out
#SBATCH --error=slurm-R3-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL

/usr/bin/time -v fastqc -o FastQC_C_out/R1_C -t 1 /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz

exit