#!/bin/bash


#SBATCH --job-name=HTSEQ 
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 1
#SBATCH --mem=50GB
#SBATCH --output=slurm_outputs/HTSEQ/slurm-HTSEQ-%j.out
#SBATCH --error=slurm_outputs/HTSEQ/slurm-HTSEQ_out-%j.err
#SBATCH --mail-user=cwell@uoregon.edu
#SBATCH --mail-type=ALL


conda activate QAA 


/usr/bin/time -v htseq-count  --stranded=yes /home/cwell/bgmp/bioinfo/Bi623/QAA/Sorted_Control_Align_Out.sam /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.112.gtf > HTSEQ_out/Control_Strand_Yes_Counts.genecount

/usr/bin/time -v htseq-count  --stranded=reverse /home/cwell/bgmp/bioinfo/Bi623/QAA/Sorted_Control_Align_Out.sam /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.112.gtf > HTSEQ_out/Control_Strand_Rev_Counts.genecount

/usr/bin/time -v htseq-count  --stranded=yes /home/cwell/bgmp/bioinfo/Bi623/QAA/Sorted_Sample11_Align_Out.sam /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.112.gtf > HTSEQ_out/Sample_11_Strand_Yes_Counts.genecount

/usr/bin/time -v htseq-count  --stranded=reverse /home/cwell/bgmp/bioinfo/Bi623/QAA/Sorted_Sample11_Align_Out.sam /home/cwell/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.112.gtf > HTSEQ_out/Sample_11_Strand_Rev_Counts.genecount

exit 