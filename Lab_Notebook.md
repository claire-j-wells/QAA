August 24th, 2024: Still Reeling from the Fact that I Exist 
---

Made a copy of Leslie's repo and put it in `/home/cwell/bgmp/bioinfo/Bi623/QAA`

`git clone https://github.com/claire-j-wells/QAA.git`

Made this beautiful lab notebook. 

Claire 11_2H_both_S9_L008      14_3B_control_S10_L008

Path files:

11_2H_both_S9_L008 <br>

11_R1: `/projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R1_001.fastq.gz`

11_R2: `/projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R2_001.fastq.gz`

14_3B_control_S10_L008 <br>

C_R1: `/projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R1_001.fastq.gz`

C_R2: `/projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz`

Created conda environment:

`conda create --name QAA`

`conda install --name QAA fastqc=0.12.1`

Verified by:
`conda activate QAA`

`conda list`

`fastqc --version`

updated python to 3.12:
`conda install --name QAA python=3.12`

Data exploration stuff

For length of files: 

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz | wc -l`

| File name | `wc -l` | Num. Records | Phred encoding | File Size | Read Length
|---|---|---|---|---|---|
| 11_2H_both_S9_L008_R1_001.fastq.gz | 71676772 | 17919193 | phred+33 | 917M | 101
| 11_2H_both_S9_L008_R2_001.fastq.gz | 71676772 | 17919193 | phred+33 | 987M | 101
| 14_3B_control_S10_L008_R2_001.fastq.gz | 17761512  | 4440378 | phred+33 | 231M | 101
| 14_3B_control_S10_L008_R2_001.fastq.gz | 17761512 | 4440378 | phred+33 | 260M | 101

Checked Phred Encoding by heading first 3 records, one from each set: 

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R1_001.fastq.gz | head -n 12`

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/14_3B_control_S10_L008_R2_001.fastq.gz | head -n 12`

Phred +33 encoding due to pound signs and slashes 

Check file size: `ls -lah /projects/bgmp/shared/2017_sequencing/demultiplexed/`

How I figured out read length: file name adjusted, output reported in table above:

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/11_2H_both_S9_L008_R2_001.fastq.gz | sed -n '2~4p' | awk '{print length($0)}'
| head -4`



SBATCH Job Numbers  ***ADD SLURM OUTPUT STUFF***

15875292 11_R1 <br>
15875291 11_R2 <br>
15875308 R1_C <br>
15875309 R2_C <br>

Sorted images into `Lab_Notebook_png/FastQC` folder. Four sub directories: `R1_11 and R2_11` and `R1_C and R2_C` respectively. Will add organized images to lab notebook later. 




Need N-content and per base quality




Install Trimmomatic and CutAdapt

`conda install --name QAA cutadapt=4.9`

`conda install --name QAA trimmomatic=0.39`

Versions Verified to be correct. 

