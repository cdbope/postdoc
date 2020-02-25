#!/bin/bash
#PBS -N gatk
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt
OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}

bam=/mnt/lustre/groups/CBBI0818/Team_Sim/Team_Sim_Data/AFR/
#AFR_40.realign.final.bam
#Simulation/OUTPUT/NEW/AFR/WithMut/
#Simulation/OUTPUT/AFR/
out=${VCF}GOLDEN/GATK/

## TESTING
ANC=$1
CHR=$2

${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T HaplotypeCaller \
-R ${REF}ucsc.hg19.fasta \
-I ${bam}AFR_40.realign.final.bam \
--filter_bases_not_stored \
--dontUseSoftClippedBases \
--filter_mismatching_base_and_quals \
--emitRefConfidence GVCF \
--filter_reads_with_N_cigar \
--genotyping_mode DISCOVERY \
-stand_call_conf 30 \
-stand_emit_conf 30 \
-L chr${CHR} \
-nct 4 \
-variant_index_type LINEAR -variant_index_parameter 128000 \
-o ${out}AFR_${ANC}_golden.GATK.${CHR}.g.vcf

