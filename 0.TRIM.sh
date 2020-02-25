#!/bin/bash
#PBS -N algn
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00


. /mnt/lustre/users/echimusa/AGe_NGS/config.txt

# Sickle trims a read at the point needed to maintain its average quality over 20. 
#It also discards reads that are shorter than 20 bp. 
#These are very good default values, but in this extra exercise you’re welcome to 
#change the values of these parameters using the -q and -l flags.

${sickle} pe \
-f ${fastq}${SAM}_L001_R1_001.fastq.gz \
-r ${fastq}${SAM}_L001_R2_001.fastq.gz \
-t sanger \
-o ${fastq}${SAM}_L001_R1_001.trim.fastq.gz \
-p ${fastq}${SAM}_L001_R2_001.trim.fastq.gz \
-s ${fastq}${SAM}.unpaired.fastq \
-q 20 -l 20
