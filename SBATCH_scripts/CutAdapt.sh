#!/bin/bash

#SBATCH --job-name=CutAdapt
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50G
#SBATCH --nodes=1
#SBATCH --output=slurm-R3-%j.out
#SBATCH --error=slurm-R3-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL

conda activate QAA

/usr/bin/time -v cutadapt \
    -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
    -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
    -o trimmed.R1_Control.fastq.gz -p trimmed.R2_Control.fastq.gz \
    /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz

/usr/bin/time -v cutadapt \
    -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
    -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
    -o trimmed.R1_11.fastq.gz -p trimmed.R2_11.fastq.gz \
    /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R2_001.fastq.gz

exit 