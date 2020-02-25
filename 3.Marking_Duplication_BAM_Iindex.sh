#!/bin/bash
#PBS -N Dupl_Index
#PBS -S /bin/bash
#PBS -q UCTlong
#PBS -l nodes=1:series600:ppn=32
#PBS -d /researchdata/fhgfs/eragumika/exonic_data/ALGN/
#PBS -M echimusa@gmail.com


. /researchdata/fhgfs/wrg/emile/script/config1.txt

HAPMAPVCF=${hapmap}
OMNIVCF=${omni}
KGVCF=${1000GConf}
DBSNPVCF=${dbsnp}

vcf1=${out}${DATA_PREFIX}.UGeno_recalibrated_snps_raw.snp.vcf
GINDSNPVCF=${1000GMills}
INDSNPVCF=${1000GIndel}


	
out=/researchdata/fhgfs/eragumika/exonic_data/ALGN/
tmp=${out}tmp/

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_PICARD}MarkDuplicates.jar \
INPUT=${out}110420_I251_FCC007KABXX_L1_index6.sorted.bam \
OUTPUT=${out}110420_I251_FCC007KABXX_L1_index6.marked.bam \
METRICS_FILE=${tmp}FCC007KABXX_L1_index6.metric CREATE_INDEX=true VALIDATION_STRINGENCY=LENIENT

echo $"Creating the bam index"

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_PICARD}BuildBamIndex.jar \
INPUT=${out}110420_I251_FCC007KABXX_L1_index6.marked.bam

