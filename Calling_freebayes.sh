#!/bin/bash
#PBS -N FreeBayes
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt


start_time=$(date +%s)

HAPMAPVCF=${hapmap}
OMNIVCF=${omni}
KGVCF=${Conf}
DBSNPVCF=${dbsnp}
GINDSNPVCF=${Mills}
INDSNPVCF=${Indel}

out=${VCF}/freebayes

${freebaye} -r chr${CHR} --use-best-n-alleles 4 -f ${REF}.fasta \
${in}105_S1.realigned.fixed.bam \
${in}107_S1.realigned.fixed.bam \
${in}149_S1.realigned.fixed.bam \
${in}161_S1.realigned.fixed.bam \
${in}168_S1.realigned.fixed.bam \
${in}188_S1.realigned.fixed.bam \
${in}1_S1.realigned.fixed.bam \
${in}218_S1.realigned.fixed.bam \
${in}240_S1.realigned.fixed.bam \
${in}244_S1.realigned.fixed.bam \
${in}266_S1.realigned.fixed.bam \
${in}274_S1.realigned.fixed.bam \
${in}276_S1.realigned.fixed.bam \
${in}288_S1.realigned.fixed.bam \
${in}289_S1.realigned.fixed.bam \
${in}293_S1.realigned.fixed.bam \
${in}29_S1.realigned.fixed.bam \
${in}2_S1.realigned.fixed.bam \
${in}333_S1.realigned.fixed.bam \
${in}387_S1.realigned.fixed.bam \
${in}398_S1.realigned.fixed.bam \
${in}3_S1.realigned.fixed.bam \
${in}401_S1.realigned.fixed.bam \
${in}402_S1.realigned.fixed.bam \
${in}458_S1.realigned.fixed.bam \
${in}47_S1.realigned.fixed.bam \
${in}496_S1.realigned.fixed.bam \
${in}4_S1.realigned.fixed.bam \
${in}587_S1.realigned.fixed.bam \
${in}5_S1.realigned.fixed.bam \
${in}6_S1.realigned.fixed.bam \
${in}72_S1.realigned.fixed.bam \
${in}7_S1.realigned.fixed.bam \
${in}82_S1.realigned.fixed.bam \
${in}84_S1.realigned.fixed.bam \
${in}8_S1.realigned.fixed.bam \
${in}AW1-109_S1.realigned.fixed.bam \
${in}AW1-117_S1.realigned.fixed.bam \
${in}AW1-125_S1.realigned.fixed.bam \
${in}AW1-132_S1.realigned.fixed.bam \
${in}AW1-134_S1.realigned.fixed.bam \
${in}AW1-14_S1.realigned.fixed.bam \
${in}AW1-208_S1.realigned.fixed.bam \
${in}AW1-224_S1.realigned.fixed.bam \
${in}AW1-230_S1.realigned.fixed.bam \
${in}AW1-335_S1.realigned.fixed.bam \
${in}AW1-351_S1.realigned.fixed.bam \
${in}AW1-376_S1.realigned.fixed.bam \
${in}AW1-385_S1.realigned.fixed.bam \
${in}AW1-426_S1.realigned.fixed.bam \
${in}AW1-427_S1.realigned.fixed.bam \
${in}AW1-449_S1.realigned.fixed.bam \
${in}AW1-461_S1.realigned.fixed.bam \
${in}AW1-485_S1.realigned.fixed.bam \
${in}AW1-48_S1.realigned.fixed.bam \
${in}AW1-508_S1.realigned.fixed.bam \
${in}AW1-512_S1.realigned.fixed.bam \
${in}AW1-515_S1.realigned.fixed.bam \
${in}AW1-548_S1.realigned.fixed.bam \
${in}AW1-580_S1.realigned.fixed.bam \
${in}AW1-627_S1.realigned.fixed.bam \
${in}AW1-653_S1.realigned.fixed.bam \
${in}AW1-81_S1.realigned.fixed.bam \
${in}AW2-83_S1.realigned.fixed.bam \
${in}AW2-84_S1.realigned.fixed.bam \
${in}SCD-107_S1.realigned.fixed.bam \
${in}SCD-109_S1.realigned.fixed.bam \
${in}SCD-10_S1.realigned.fixed.bam \
${in}SCD-12_S1.realigned.fixed.bam \
${in}SCD-164_S1.realigned.fixed.bam \
${in}SCD-16_S1.realigned.fixed.bam \
${in}SCD-170_S1.realigned.fixed.bam \
${in}SCD-173_S1.realigned.fixed.bam \
${in}SCD-185_S1.realigned.fixed.bam \
${in}SCD-186_S1.realigned.fixed.bam \
${in}SCD-193_S1.realigned.fixed.bam \
${in}SCD-200_S1.realigned.fixed.bam \
${in}SCD-210_S1.realigned.fixed.bam \
${in}SCD-21_S1.realigned.fixed.bam \
${in}SCD-24_S1.realigned.fixed.bam \
${in}SCD-265_S1.realigned.fixed.bam \
${in}SCD-278_S1.realigned.fixed.bam \
${in}SCD-27_S1.realigned.fixed.bam \
${in}SCD-31_S1.realigned.fixed.bam \
${in}SCD-334_S1.realigned.fixed.bam \
${in}SCD-344_S1.realigned.fixed.bam \
${in}SCD-351_S1.realigned.fixed.bam \
${in}SCD-352_S1.realigned.fixed.bam \
${in}SCD-36_S1.realigned.fixed.bam \
${in}SCD-374_S1.realigned.fixed.bam \
${in}SCD-378_S1.realigned.fixed.bam \
${in}SCD-37_S1.realigned.fixed.bam \
${in}SCD-382_S1.realigned.fixed.bam \
${in}SCD-384_S1.realigned.fixed.bam \
${in}SCD-393_S1.realigned.fixed.bam \
${in}SCD-400_S1.realigned.fixed.bam \
${in}SCD-43_S1.realigned.fixed.bam \
${in}SCD-501_S1.realigned.fixed.bam \
${in}SCD-502_S1.realigned.fixed.bam \
${in}SCD-505_S1.realigned.fixed.bam \
${in}SCD-506_S1.realigned.fixed.bam \
${in}SCD-524_S1.realigned.fixed.bam \
${in}SCD-529_S1.realigned.fixed.bam \
${in}SCD-6_S1.realigned.fixed.bam \
${in}SCD-7_S1.realigned.fixed.bam \
-v ${out}sickle_cell_freebayes.${CHR}.vcf


#cp ${out}sickle_cell_freebayes.vcf ${out}TEMP/

#${EXE_BGZIP} -f ${out}sickle_cell_freebayes.vcf
#${EXE_TABIX} -p vcf ${out}sickle_cell_freebayes.vcf.gz

#mv ${out}TEMP/sickle_cell_freebayes.vcf ${out}

#${EXE_BCFTOOL}bcftools stats -F ${REF}.fasta -s - ${out}sickle_cell_freebayes.vcf.gz > ${out}sickle_cell_freebayes.vcf.gz.stats

#${EXE_BCFTOOL}plot-vcfstats -p ${out} ${out}sickle_cell_freebayes.vcf.gz.stats


