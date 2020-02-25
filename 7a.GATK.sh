#!/bin/bash
#PBS -N gatk
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/users/echimusa/AGe_NGS/config.txt

OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}
INDSNPVCF=${indels}

${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T HaplotypeCaller \
-R ${refast} \
-I ${bam}${SAM}.final.bam \
--filter_bases_not_stored \
--filter_mismatching_base_and_quals \
--emitRefConfidence GVCF \
--filter_reads_with_N_cigar \
--genotyping_mode DISCOVERY \
-stand_call_conf 30 \
-stand_emit_conf 30 \
-nct 4 \
-variant_index_type LINEAR -variant_index_parameter 128000 \
-o ${vcf}${SAM}.g.vcf

