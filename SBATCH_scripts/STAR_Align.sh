#!/bin/bash


#SBATCH --job-name=STAR_Align 
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50G
#SBATCH --output=slurm_outputs/Star_Align/slurm-Star_Align_11_out-%j.out
#SBATCH --error=slurm_outputs/Star_Align/slurm-Star_Align_11_out-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL


conda activate QAA 


/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesCommand zcat \
 --readFilesIn /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_forward_paired_R1_11.fq.gz /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_reverse_paired_R2_11.fq.gz \
 --genomeDir /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
 --outFileNamePrefix Sample11_Align

 exit



#  /usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
#  --outFilterMultimapNmax 3 \
#  --outSAMunmapped Within KeepPairs \
#  --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesCommand zcat \
#  --readFilesIn /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_forward_paired_R1_Control.fq.gz /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_reverse_paired_R2_Control.fq.gz \
#  --genomeDir /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
#  --outFileNamePrefix Control_Align