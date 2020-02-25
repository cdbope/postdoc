#!/bin/bash
#PBS -N bcftools
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

#bam=/mnt/lustre/groups/CBBI0818/Team_Sim/Simulation/OUTPUT/AFR/
bam=/mnt/lustre/groups/CBBI0818/Team_Sim/BAM/NEW/AFR/
out=${VCF}GOLDEN/BCF/

${bcftools} mpileup -Ou -S sample.txt -f ${REF}ucsc.hg19.fasta \
${bam}AFR_40.realign.final.bam \
${bam}AFR_41.realign.final.bam \
${bam}AFR_3.realign.final.bam | ${bcftools} call -vmO z -o ${out}AFR_golden.bcftools.vcf.gz

#${bcftools} filter -O z -o ${out}AFR_golden.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}AFR_golden.bcftools.vcf.gz
