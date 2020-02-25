#!/bin/bash
#PBS -N gatk
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

#bam=/mnt/lustre/groups/CBBI0818/Team_Sim/Simulation/OUTPUT/AFR/
bam=/mnt/lustre/groups/CBBI0818/Team_Sim/BAM/NEW/AFR/
out=${VCF}GOLDEN/Platypus/

source /apps/user/CBBI0818/venv.python2_7/bin/activate

python ${platypus} callVariants --refFile=${REF}ucsc.hg19.fasta \
--bamFiles=${bam}AFR_40.realign.final.bam,${bam}AFR_41.realign.final.bam,${bam}AFR_3.realign.final.bam \
--nCPU=8 --output=${out}AFR_golden.chr${CHR}.Platypus.vcf

#--regions=chr${CHR} \
python ${platypus} continueCalling --vcfFile=${out}AFR_golden.chr${CHR}.Platypus.vcf #--output=${out}AFR_golden.chr${CHR}.Platypus.cns.vcf

