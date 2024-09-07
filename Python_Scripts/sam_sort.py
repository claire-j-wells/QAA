#!/usr/bin/env python

#This script counts mapped and unmapped reads in a sam file!
import argparse
def get_args():
    parser = argparse.ArgumentParser(description="A program to introduce yourself")
    parser.add_argument("-sam", help="input Sam File", required= True)
    return parser.parse_args()


args = get_args()
sam_file = args.sam #sorted file 1 from blastp output



#Establish your counters here. 
mapped_reads = 0 
unmapped_reads = 0
with open(sam_file,"r") as sh: #Open your file
    for line in sh:
        if line.startswith("@"): #Eliminate headers by continuing past lines that start with @
            continue 
        line_list = line.split("\t")
        flag = int(line_list[1])  #specifically flag the pull out the bitscore 
        if((flag & 256) != 256):  #checks if it's a secondary alignment, ignore
            if((flag & 4) != 4):  #if true, read is mapped, false is unmapped
                mapped_reads+=1 #count!
            else:
                unmapped_reads+=1 #count! 
        


print(f'Number of Mapped Reads: {mapped_reads}')
print(f'Number of Unmapped Reads: {unmapped_reads}')


#Number of Mapped Reads: 21851108
#Number of Unmapped Reads: 1645850

