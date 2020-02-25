#!/bin/bash
#PBS -N VC_FreeBayes
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

DBSNPVCF=${dbsnp}

freebayes -F 0.01 -f ${REF}ucsc.hg19.fasta ${BAM}NEW/${ANC}/${ANC}_${CHR}.realign.final.bam > ${VCF}FreeBayes/FreeBayes_Calls.vcf


#Initial Cov samples
freebayes -F 0.01 -f ${REF}ucsc.hg19.fasta ${BAM}NEW/${ANC}/${ANC}_${CHR}.realign.final.bam > ${VCF}FreeBayes/FreeBayes_Calls.vcf

#Initial Cov Golden
lofreq call --call-indels \
-f ${REF}ucsc.hg19.fasta \
-o ${VCF}Lofreq/Lofreq_Calls_Golden.vcf \
-s ${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_golden.bam \
-S $DBSNPVCF

#Altered Cov samples
lofreq call --call-indels \
-f ${REF}ucsc.hg19.fasta \
-o ${VCF}Lofreq/Lofreq_Calls_altcov.vcf \
-s ${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.realign.final.bam \
-S $DBSNPVCF

#Altered Cov Golden
lofreq call --call-indels \
-f ${REF}ucsc.hg19.fasta \
-o ${VCF}Lofreq/Lofreq_Calls_altcov_Golden.vcf \
-s ${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_altcov_golden.bam \
-S $DBSNPVCF
