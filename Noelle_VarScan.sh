#!/bin/bash
#PBS -N VarScan_
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt

sample=/mnt/lustre/groups/CBBI0818/NOELLE/SHELL/samplefiles/AFR_H.sample.txt



#AFR - Low Cov
#out=${VCF}VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/AFR/AFR_10_altcov_final.bam \
#${BAM}NEW/AFR/AFR_9_altcov_final.bam \
#${BAM}NEW/AFR/AFR_45_altcov_final.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}AFR_lowcov.VarScan.vcf > ${out}AFR_lowcov.VarScan.log.vcf


#AFR - High Cov
out=${VCF}VarScan/
${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
${BAM}NEW/AFR/AFR_10_final.bam \
${BAM}NEW/AFR/AFR_15_final.bam \
${BAM}NEW/AFR/AFR_20_final.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
--vcf-sample-list ${sample} --output-vcf ${out}AFR_highcov.VarScan.vcf > ${out}AFR_highcov.VarScan.log.vcf

#EUR - High Cov
#out=${VCF}VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_altcov_final.bam \
#${BAM}NEW/EUR/EUR_9_altcov_final.bam \
#${BAM}NEW/EUR/EUR_45_altcov_final.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}EUR_highcov.VarScan.vcf > ${out}EUR_highcov.VarScan.log.vcf


#EUR - Low Cov
#out=${VCF}VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${BAM}NEW/EUR/EUR_10_final.bam \
#${BAM}NEW/EUR/EUR_15_final.bam \
#${BAM}NEW/EUR/EUR_20_final.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}EUR_lowcov.VarScan.vcf > ${out}EUR_lowcov.VarScan.log.vcf


#AFR - Low Cov -Golden
#out=${VCF}GOLDEN/VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_9_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_45_sim_lowcov_golden.fixed.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}AFR_lowcov_golden.VarScan.vcf > ${out}AFR_lowcov_golden.VarScan.log.vcf


#AFR - High Cov
#out=${VCF}GOLDEN/VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_15_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_20_sim_highcov_golden.fixed.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}AFR_highcov_golden.VarScan.vcf > ${out}AFR_highcov_golden.VarScan.log.vcf

#EUR - High Cov
#out=${VCF}GOLDEN/VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_9_sim_highcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_45_sim_highcov_golden.fixed.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}EUR_highcov_golden.VarScan.vcf > ${out}EUR_highcov_golden.VarScan.log.vcf

#EUR - Low Cov
#out=${VCF}GOLDEN/VarScan/
#${samtool} mpileup -B -f ${REF}ucsc.hg19.fasta \
#${outsim}NEW/AFR/AFR_10_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_15_sim_lowcov_golden.fixed.bam \
#${outsim}NEW/AFR/AFR_20_sim_lowcov_golden.fixed.bam | ${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${varscan} mpileup2cns \
#--vcf-sample-list ${sample} --output-vcf ${out}EUR_lowcov_golden.VarScan.vcf > ${out}EUR_lowcov_golden.VarScan.log.vcf


