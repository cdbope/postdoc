#!/bin/bash
#PBS -N VarScan
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

#bam=/mnt/lustre/groups/CBBI0818/NOELLE/Simulation/OUTPUT/AFR/
bam=/mnt/lustre/groups/CBBI0818/NOELLE/BAM/NEW/AFR/
out=${VCF}GOLDEN/VarScan/

sample=/mnt/lustre/groups/CBBI0818/NOELLE/SHELL/sample.txt

${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
${bam}AFR_40.realign.final.bam \
${bam}AFR_41.realign.final.bam \
${bam}AFR_3.realign.final.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns --vcf-sample-list ${sample} --output-vcf ${out}AFR_golden.VarScan.vcf > ${out}AFR_golden.VarScan.log.vcf
