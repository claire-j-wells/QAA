#!/usr/bin/env python 
#./trimmed_dist.py -R1 /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_forward_paired_R1_11.fq.gz -R2 /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_reverse_paired_R2_11.fq.gz -o Sample_11
#./trimmed_dist.py -R1 /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_forward_paired_R1_Control.fq.gz -R2 /home/cwell/bgmp/bioinfo/Bi623/QAA/trimmomatic_out/output_reverse_paired_R2_Control.fq.gz -o Control
import argparse
def get_args():
    parser = argparse.ArgumentParser(description="A program to introduce yourself")
    parser.add_argument("-R1","--r1", help="inputfile", required= True)
    parser.add_argument("-R2","--r2", help="input file", required = True)
    parser.add_argument("-output","--o",help="output figure", required = True)
    return parser.parse_args()

import matplotlib.pyplot as plt 
import gzip
import argparse
args = get_args()
R1 = args.r1 #sorted file 1 from blastp output
R2 = args.r2 #sorted file 2 from blastp output 
output = args.o


#length of reads on the x axis and number of reads on the y axis 
# def list_lengths_dist(filename):
#     lengths_counts = {} #keys are lengths and values are counts 
#     with gzip.open(filename,"rt") as fh:
#         i = 0   #i takes on the value of 0, counting and starting with 0
#         for line in fh: #going line by line in file 
#             i+=1  #adding 1 to i, incrementing 1 to i 
#             line = line.strip('\n') #
#             if i%4 == 2:  #find the 2nd, 6th, 10th
#                 if len(line) in lengths_counts:
#                     lengths_counts[len(line)] += 1
#                 else:
#                     lengths_counts[len(line)] = 1
#     return lengths_counts

# R1 = list_lengths_dist(filename=R1)
# R2 = list_lengths_dist(filename=R2)


def list_lengths_dist(filename):
    lengths_counts = [] #keys are lengths and values are counts 
    with gzip.open(filename,"rt") as fh:
        i = 0   #i takes on the value of 0, counting and starting with 0
        for line in fh: #going line by line in file 
            i+=1  #adding 1 to i, incrementing 1 to i 
            line = line.strip('\n') #
            if i%4 == 2:  #find the 2nd, 6th, 10th
                lengths_counts.append(len(line))
    return lengths_counts

R1 = list_lengths_dist(filename=R1)
R2 = list_lengths_dist(filename=R2)


import numpy as np

# R1_Sample_11 = R1
# lengths_R1 = sorted(list(R1_Sample_11.keys()))
# occurrences_R1 = [R1_Sample_11[key] for key in lengths_R1]


# R2_Sample_11 = R2
# lengths_R2 = sorted(list(R2_Sample_11.keys()))
# occurrences_R2 = [R2_Sample_11[key] for key in lengths_R2]

# x_label = lengths_R1
# occurrences_R1 = [R1_Sample_11[x] for x in lengths_R1]
# occurrences_R2 = [R2_Sample_11[x] for x in lengths_R2]
# bins = np.linspace(0, 101, 30)
#plt.hist([occurrences_R1, occurrences_R2], bins, label=['R1','R2'])


 
plt.hist([R1, R2],label=["R1","R2"], bins = 66)
plt.yscale('log')
plt.legend(loc='upper left')
plt.title(f'Distribution of Trimmed Reads from {output}')
plt.xlabel("Length of Reads")
plt.ylabel("Number of Reads")
plt.savefig(f'{output}.png')

# plt.bar(x_axis,occurrences_R1, label = R1)
# plt.bar(x_axis,occurrences_R2, label = R2)

# plt.legend()
# plt.savefig(f'{output}.png')