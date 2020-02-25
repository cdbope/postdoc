#!/bin/bash
#PBS -N samtools
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

#bam=/mnt/lustre/groups/CBBI0818/Team_Sim/Simulation/OUTPUT/AFR/
bam=/mnt/lustre/groups/CBBI0818/Team_Sim/FIX/


${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
-r chr22 -l /mnt/lustre/groups/CBBI0818/Team_Sim/SHELL/BED_CHR/CHR22.bed \
${bam}EUR_15_final.bam \
${bam}EUR_10_final.bam \
${bam}EUR_20_final.bam | ${EXE_BCFTOOL} call -mv - > ${bam}EUR_test.samtools.vcf
