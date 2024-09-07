#!/bin/bash


#SBATCH --job-name=STAR_Database
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50G
#SBATCH --nodes=1
#SBATCH --output=slurm_outputs/Star_Database/slurm-Star_Database_out-%j.out
#SBATCH --error=slurm_outputs/Star_Database/slurm-Star_Database_out-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL



conda activate QAA

/usr/bin/time -v STAR --runThreadN 8 \
 --runMode genomeGenerate \
 --genomeDir /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --genomeFastaFiles /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna_sm.primary_assembly.fa \
 --sjdbGTFfile /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.112.gtf


exit 