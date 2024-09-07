#!/bin/bash

#SBATCH --job-name=11_R1
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=4
#SBATCH -c 8
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --output=slurm-R3-%j.out
#SBATCH --error=slurm-R3-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL


/usr/bin/time -v fastqc -o FastQC_11_out/R1_11 -t 1 /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R1_001.fastq.gz

exit


