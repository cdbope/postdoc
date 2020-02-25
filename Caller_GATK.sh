#!/bin/bash
#PBS -N VC_GATK
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

DBSNPVCF=${dbsnp}

#Initial Cov samples
java -jar GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ${REF}ucsc.hg19.fasta \
-stand call conf 30.0 stand emit conf 10.0 \
--dbsnp $DBSNPVCF \
#-L target.bed \
-I ${BAM}NEW/${ANC}/${ANC}_${CHR}.realign.final.bam \
-o ${VCF}GATK/GATK_Calls.vcf

#Initial Cov Golden
java -jar GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ${REF}ucsc.hg19.fasta \
-stand call conf 30.0 stand emit conf 10.0 \
--dbsnp $DBSNPVCF \
#-L target.bed \
-I ${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_golden.bam \
-o ${VCF}GATK/GATK_Calls_Golden.vcf

#Altered Cov samples
java -jar GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ${REF}ucsc.hg19.fasta \
-stand call conf 30.0 stand emit conf 10.0 \
--dbsnp $DBSNPVCF \
#-L target.bed \
-I ${BAM}NEW/${ANC}/${ANC}_${CHR}_altcov.realign.final.bam \
-o ${VCF}GATK/GATK_Calls_altcov.vcf


#Altered Cov Golden
java -jar GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ${REF}ucsc.hg19.fasta \
-stand call conf 30.0 stand emit conf 10.0 \
--dbsnp $DBSNPVCF \
#-L target.bed \
-I ${outsim}NEW/${ANC}/${ANC}_${CHR}_sim_reads_altcov_golden.bam \
-o ${VCF}GATK/GATK_Calls_altcov_Golden.vcf


