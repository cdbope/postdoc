#!/bin/bash
#PBS -N freebayes
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt


#AFR-High Cov
out=${VCF}freebayes/
CHR=22
${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
${BAM}NEW/AFR/AFR_10_final.bam \
${BAM}NEW/AFR/AFR_15_final.bam \
${BAM}NEW/AFR/AFR_20_final.bam -v ${out}AFR_highcov.freebayes.${CHR}.vcf

#EUR - Low Cov
#out=${VCF}freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_final.bam\
#${BAM}NEW/EUR/EUR_15_final.bam\
#${BAM}NEW/EUR/EUR_20_final.bam -v ${out}EUR_lowcov.freebayes.${CHR}.vcf

#AFR-Low Cov
#out=${VCF}freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/AFR/AFR_10_altcov_final.bam\
#${BAM}NEW/AFR/AFR_15_altcov_final.bam\
#${BAM}NEW/AFR/AFR_20_altcov_final.bam -v ${out}AFR_lowcov.freebayes.${CHR}.vcf

#EUR - High Cov
#out=${VCF}freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_altcov_final.bam\
#${BAM}NEW/EUR/EUR_15_altcov_final.bam\
#${BAM}NEW/EUR/EUR_20_altcov_final.bam -v ${out}EUR_highcov.freebayes.${CHR}.vcf

#AFR-Golden BAM -Low Coverage
#out=${VCF}GOLDEN/freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_lowcov_golden.fixed.bam\
#${outsim}NEW/AFR/AFR_15_sim_lowcov_golden.fixed.bam\
#${outsim}NEW/AFR/AFR_20_sim_lowcov_golden.fixed.bam -v ${out}AFR_GOLDEN_lowcov.freebayes.${CHR}.vcf

#EUR - Golden BAM -high cov
#out=${VCF}GOLDEN/freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/EUR/EUR_10_sim_highcov_golden.fixed.bam\
#${outsim}NEW/EUR/EUR_15_sim_highcov_golden.fixed.bam\
#${outsim}NEW/EUR/EUR_20_sim_highcov_golden.fixed.bam -v ${out}EUR_GOLDEN_highcov.freebayes.${CHR}.vcf

#AFR-Golden BAM -High Coverage
#out=${VCF}GOLDEN/freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_highcov_golden.fixed.bam\
#${outsim}NEW/AFR/AFR_15_sim_highcov_golden.fixed.bam\
#${outsim}NEW/AFR/AFR_20_sim_highcov_golden.fixed.bam -v ${out}AFR_GOLDEN_highcov.freebayes.${CHR}.vcf

#EUR - Golden BAM -low cov
#out=${VCF}GOLDEN/freebayes/
#${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/EUR/EUR_10_sim_lowcov_golden.fixed.bam\
#${outsim}NEW/EUR/EUR_15_sim_lowcov_golden.fixed.bam\
#${outsim}NEW/EUR/EUR_20_sim_lowcov_golden.fixed.bam -v ${out}EUR_GOLDEN_lowcov.freebayes.${CHR}.vcf

