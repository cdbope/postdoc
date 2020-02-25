#!/bin/bash
#PBS -N Brecal
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

	
${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_GATK} \
-T BaseRecalibrator -l INFO \
-I ${out}110420_I251_FCC007KABXX_L1_index6.realign.fixed.bam -R ${refdata}.fasta \
--knownSites $INDSNPVCF \
--knownSites $GINDSNPVCF \
--knownSites $DBSNPVCF \
-nt 1 \
-nct 8 \
-o ${tmp}recalibration_H3Aass.grp

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_GATK} \
-l INFO \
-T PrintReads \
-R ${refdata}.fasta \
-I ${out}110420_I251_FCC007KABXX_L1_index6.realign.fixed.bam \
-BQSR ${tmp}recalibration_H3Aass.grp \
-o ${out}110420_I251_FCC007KABXX_L1_index6.realign.final.bam

