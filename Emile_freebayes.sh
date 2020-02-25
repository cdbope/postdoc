#!/bin/bash
#PBS -N freebayes
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

#bam=/mnt/lustre/groups/CBBI0818/Team_Sim/Simulation/OUTPUT/AFR/
bam=/mnt/lustre/groups/CBBI0818/Team_Sim/BAM/NEW/AFR/
out=${VCF}GOLDEN/freebayes/
#CHR=22
${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
${bam}AFR_40.realign.final.bam \
${bam}AFR_41.realign.final.bam \
${bam}AFR_3.realign.final.bam -v ${out}AFR_golden.freebayes.${CHR}.vcf

# -r chr${CHR}
