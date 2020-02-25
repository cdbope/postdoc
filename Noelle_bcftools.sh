#!/bin/bash
#PBS -N bcftools_
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt


#AFR - Low Cov
#out=${VCF}BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/AFR/AFR_10_altcov_final.bam \
#${BAM}NEW/AFR/AFR_45_altcov_final.bam \
#${BAM}NEW/AFR/AFR_9_altcov_final.bam | ${bcftools} call -vmO z -o ${out}AFR_lowcov.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}AFR_lowcov.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}AFR_lowcov.bcftools.vcf.gz

#AFR - High Cov
out=${VCF}BCF/
${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
${BAM}NEW/AFR/AFR_10_final.bam \
${BAM}NEW/AFR/AFR_15_final.bam \
${BAM}NEW/AFR/AFR_20_final.bam | ${bcftools} call -vmO z -o ${out}AFR_highcov.bcftools.vcf.gz

${bcftools} filter -O z -o {out}AFR_highcov.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}AFR_highcov.bcftools.vcf.gz

#EUR - Low Cov
#out=${VCF}BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_final.bam \
#${BAM}NEW/EUR/EUR_15_final.bam \
#${BAM}NEW/EUR/EUR_20_final.bam | ${bcftools} call -vmO z -o ${out}EUR_lowcov.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}EUR_lowcov.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}EUR_lowcov.bcftools.vcf.gz


#EUR - High Cov
#out=${VCF}BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_altcov_final.bam \
#${BAM}NEW/EUR/EUR_45_altcov_final.bam \
#${BAM}NEW/EUR/EUR_9_altcov_final.bam | ${bcftools} call -vmO z -o ${out}EUR_highcov.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}EUR_highcov.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}EUR_highcov.bcftools.vcf.gz

#-----------

#AFR -Golden Low Cov
#out=${VCF}GOLDEN/BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_45_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_9_sim_lowcov_golden.fixed.bam | ${bcftools} call -vmO z -o ${out}AFR_lowcov_golden.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}AFR_lowcov_golden.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}AFR_lowcov_golden.bcftools.vcf.gz

#AFR - Golden High Cov
#out=${VCF}GOLDEN/BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_15_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_20_sim_highcov_golden.fixed.bam | ${bcftools} call -vmO z -o ${out}AFR_highcov_golden.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}AFR_highcov_golden.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}AFR_highcov_golden.bcftools.vcf.gz

#EUR -Golden Low Cov
#out=${VCF}GOLDEN/BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/EUR/EUR_10_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_15_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_20_sim_lowcov_golden.fixed.bam | ${bcftools} call -vmO z -o ${out}EUR_lowcov_golden.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}EUR_lowcov_golden.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}EUR_lowcov_golden.bcftools.vcf.gz


#EUR - Golden High Cov
#out=${VCF}GOLDEN/BCF/
#${bcftools} mpileup -Ou -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/EUR/EUR_10_sim_highcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_45_sim_highcov_golden.fixed.bam \
#${outsim}NEW/EUR/EUR_9_sim_highcov_golden.fixed.bam | ${bcftools} call -vmO z -o ${out}EUR_lowcov_golden.bcftools.vcf.gz

#${bcftools} filter -O z -o {out}EUR_lowcov_golden.bcftools.filtered.vcf.gz -s LOWQUAL -i'%QUAL>10' {out}EUR_lowcov_golden.bcftools.vcf.gz


