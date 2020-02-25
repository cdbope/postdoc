#!/bin/bash
#PBS -N samtools
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt


#AFR -Low Cov
#out=${VCF}samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${BAM}NEW/AFR/AFR_10_altcov_final.bam \
#${BAM}NEW/AFR/AFR_45_altcov_final.bam \
#${BAM}NEW/AFR/AFR_9_altcov_final.bam | ${EXE_BCFTOOL} call -mv - > ${out}AFR_lowcov.samtools.vcf

#AFR -High Cov
out=${VCF}samtools/
${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
${BAM}NEW/AFR/AFR_10_final.bam \
${BAM}NEW/AFR/AFR_15_final.bam \
${BAM}NEW/AFR/AFR_20_final.bam | ${EXE_BCFTOOL} call -mv - > ${out}AFR_highcov.samtools.vcf

#EUR -Low Cov
#out=${VCF}samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_altcov_final.bam \
#${BAM}NEW/EUR/EUR_15_altcov_final.bam \
#${BAM}NEW/EUR/EUR_20_altcov_final.bam | ${EXE_BCFTOOL} call -mv - > ${out}EUR_lowcov.samtools.vcf

#EUR -High Cov
#out=${VCF}samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_final.bam \
#${BAM}NEW/EUR/EUR_45_final.bam \
#${BAM}NEW/EUR/EUR_9_final.bam | ${EXE_BCFTOOL} call -mv - > ${out}EUR_highcov.samtools.vcf

#------------
_sim_highcov_golden.fixed.bam

#AFR - Golden Low Cov
#out=${VCF}GOLDEN/samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_15_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_20_sim_lowcov_golden.fixed.bam | ${EXE_BCFTOOL} call -mv - > ${out}AFR_lowcov_golden.samtools.vcf

#AFR - Golden High Cov
#out=${VCF}GOLDEN/samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_15_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_20_sim_highcov_golden.fixed.bam | ${EXE_BCFTOOL} call -mv - > ${out}AFR_highcov_golden.samtools.vcf

#EUR - Golden Low Cov
#out=${VCF}GOLDEN/samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${outsim}NEW/EUR/EUR_10_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_15_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_20_sim_lowcov_golden.fixed.bam | ${EXE_BCFTOOL} call -mv - > ${out}EUR_lowcov_golden.samtools.vcf

#EUR - Golden High Cov
#out=${VCF}GOLDEN/samtools/
#${samtool} mpileup -ugf ${REF}ucsc.hg19.fasta \
#${outsim}NEW/EUR/EUR_10_sim_highcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_15_sim_highcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_20_sim_highcov_golden.fixed.bam | ${EXE_BCFTOOL} call -mv - > ${out}EUR_highcov_golden.samtools.vcf



