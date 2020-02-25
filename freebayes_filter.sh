#!/bin/bash
#PBS -N freebayes_filter
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

out=${VCF}freebayes/

#${BGZIP} -c ${out}sickle_cell_freebayes.${CHR}.vcf > ${out}sickle_cell_freebayes.${CHR}.vcf.gz
#${TABIX} -p vcf ${out}sickle_cell_freebayes.${CHR}.vcf.gz

${BCFTOOL}bcftools filter -s LowQual -e '%QUAL<20 || DP>100' ${out}sickle_cell_freebayes.${CHR}.vcf.gz -Ov > ${out}sickle_cell_freebayes_filtered.${CHR}.vcf


