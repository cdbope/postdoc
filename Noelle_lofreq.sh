#!/bin/bash
#PBS -N VC_GATK
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

DBSNPVCF=${dbsnp}

#Initial Cov samples
lofreq call --call-indels \
-f ${REF}ucsc.hg19.fasta \
-o ${VCF}lofreq/${ANC}_${CHR}_Lofreq_Calls.vcf \
-s ${BAM}NEW/${ANC}/${ANC}_${CHR}.realign.final.bam \
-S $DBSNPVCF

#Initial Cov Golden
#lofreq call --call-indels \
#-f ${REF}ucsc.hg19.fasta \
#-o ${VCF}Lofreq/Lofreq_Calls_Golden.vcf \
#-s ${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_golden.bam \
#-S $DBSNPVCF

#Altered Cov samples
#lofreq call --call-indels \
#-f ${REF}ucsc.hg19.fasta \
#-o ${VCF}Lofreq/Lofreq_Calls_altcov.vcf \
#-s ${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.realign.final.bam \
#-S $DBSNPVCF

#Altered Cov Golden
#lofreq call --call-indels \
#-f ${REF}ucsc.hg19.fasta \
#-o ${VCF}Lofreq/Lofreq_Calls_altcov_Golden.vcf \
#-s ${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_altcov_golden.bam \
#-S $DBSNPVCF
