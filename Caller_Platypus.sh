#!/bin/bash
#PBS -N VC_Platypus
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

DBSNPVCF=${dbsnp}

#Initial Cov samples
python Platypus.py callVariants \
--bamFiles=${BAM}NEW/${ANC}/${ANC}_${CHR}.realign.final.bam \
--refFile ${REF}ucsc.hg19.fasta \
--output=${VCF}Platypus/Platypus_Calls.vcf \
--filterDuplicates=0 \
--minflank=0


#Initial Cov Golden
python Platypus.py callVariants \
--bamFiles=${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_golden.bam \
--refFile ${REF}ucsc.hg19.fasta \
--output=${VCF}Platypus/Platypus_Calls_Golden.vcf \
--filterDuplicates=0 \
--minflank=0


#Altered Cov samples
python Platypus.py callVariants \
--bamFiles=${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.realign.final.bam \
--refFile ${REF}ucsc.hg19.fasta \
--output=${VCF}Platypus/Platypus_Calls_altcov.vcf \
--filterDuplicates=0 \
--minflank=0


#Altered Cov Golden
python Platypus.py callVariants \
--bamFiles=${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_altcov_golden.bam \
--refFile ${REF}ucsc.hg19.fasta \
--output=${VCF}Platypus/Platypus_Calls_altcov_Golden.vcf \
--filterDuplicates=0 \
--minflank=0



