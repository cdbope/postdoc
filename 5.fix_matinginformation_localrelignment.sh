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
KGVCF=${Conf}
DBSNPVCF=${dbsnp}
GINDSNPVCF=${Mills}
INDSNPVCF=${Indel}


out=/researchdata/fhgfs/eragumika/exonic_data/ALGN/
tmp=${out}tmp/

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp}flx-auswerter -jar ${EXE_PICARD}FixMateInformation.jar \
INPUT=${out}110420_I251_FCC007KABXX_L1_index6.realign.bam \
OUTPUT=${out}110420_I251_FCC007KABXX_L1_index6.realign.fixed.bam \
SO=coordinate VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true

