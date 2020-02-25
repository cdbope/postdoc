#!/bin/bash
#PBS -N Platypus
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

source /apps/user/CBBI0818/venv.python2_7/bin/activate

#AFR - Low Cov
#out=${VCF}Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}NEW/AFR/AFR_10_altcov_final.bam,\
#${BAM}NEW/AFR/AFR_15_altcov_final.bam,\
#${BAM}NEW/AFR/AFR_20_altcov_final.bam,\
#--nCPU=8 --output=${out}AFR_lowcov.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}AFR_lowcov.chr${CHR}.Platypus.vcf #--output=${out}AFR_lowcov.chr${CHR}.Platypus.cns.vcf


#AFR - High Cov
out=${VCF}Platypus/
python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
--bamFiles=${BAM}NEW/AFR/AFR_10_final.bam,\
${BAM}NEW/AFR/AFR_15_final.bam,\
${BAM}NEW/AFR/AFR_20_final.bam,\
--nCPU=8 --output=${out}AFR_highcov.Platypus.vcf

python ${platypus} continueCalling --vcfFile=${out}AFR_highcov.Platypus.vcf #--output=${out}AFR_highcov.chr${CHR}.Platypus.cns.vcf

#EUR - High Cov
#out=${VCF}Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}NEW/EUR/EUR_10_altcov_final.bam,\
#${BAM}NEW/EUR/EUR_15_altcov_final.bam,\
#${BAM}NEW/EUR/EUR_20_altcov_final.bam,\
#--nCPU=8 --output=${out}EUR_highcov.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}EUR_highcov.chr${CHR}.Platypus.vcf #--output=${out}EUR_highcov.chr${CHR}.Platypus.cns.vcf


#EUR - Low Cov
#out=${VCF}Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}NEW/EUR/EUR_10_final.bam,\
#${BAM}NEW/EUR/EUR_15_final.bam,\
#${BAM}NEW/EUR/EUR_20_final.bam,\
#--nCPU=8 --output=${out}EUR_lowcov.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}EUR_lowcov.chr${CHR}.Platypus.vcf #--output=${out}EUR_lowcov.chr${CHR}.Platypus.cns.vcf


#AFR - Golden Low Cov
#out=${VCF}GOLDEN/Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}${outsim}NEW/AFR/AFR_10_sim_lowcov_golden.fixed.bam,\
#${outsim}NEW/AFR/AFR_15_sim_lowcov_golden.fixed.bam,\
#${outsim}NEW/AFR/AFR_20_sim_lowcov_golden.fixed.bam,\ 
#--nCPU=8 --output=${out}AFR_lowcov_golden.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}AFR_lowcov_golden.chr${CHR}.Platypus.vcf #--output=${out}AFR_lowcov_golden.chr${CHR}.Platypus.cns.vcf


#AFR - Golden High Cov
#out=${VCF}GOLDEN/Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}${outsim}NEW/AFR/AFR_10_sim_highcov_golden.fixed.bam,\
#${outsim}NEW/AFR/AFR_15_sim_highcov_golden.fixed.bam,\
#${outsim}NEW/AFR/AFR_20_sim_highcov_golden.fixed.bam,\
#--nCPU=8 --output=${out}AFR_highcov_golden.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}AFR_highcov_golden.chr${CHR}.Platypus.vcf #--output=${out}AFR_highcov_golden.chr${CHR}.Platypus.cns.vcf



#EUR - Golden High Cov
#out=${VCF}GOLDEN/Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}${outsim}NEW/EUR/EUR_10_sim_highcov_golden.fixed.bam,\
#${outsim}NEW/EUR/EUR_15_sim_highcov_golden.fixed.bam,\
#${outsim}NEW/EUR/EUR_20_sim_highcov_golden.fixed.bam,\
#--nCPU=8 --output=${out}EUR_highcov_golden.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}EUR_highcov_golden.chr${CHR}.Platypus.vcf #--output=${out}EUR_highcov_golden.chr${CHR}.Platypus.cns.vcf


#EUR - Golden Low Cov
#out=${VCF}GOLDEN/Platypus/
#python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
#--bamFiles=${BAM}${outsim}NEW/EUR/EUR_10_sim_lowcov_golden.fixed.bam,\
#${outsim}NEW/EUR/EUR_15_sim_lowcov_golden.fixed.bam,\
#${outsim}NEW/EUR/EUR_20_sim_lowcov_golden.fixed.bam,\
#--nCPU=8 --output=${out}EUR_lowcov_golden.chr${CHR}.Platypus.vcf

#python ${platypus} continueCalling --vcfFile=${out}EUR_lowcov_golden.chr${CHR}.Platypus.vcf #--output=${out}EUR_lowcov_golden.chr${CHR}.Platypus.cns.vcf






