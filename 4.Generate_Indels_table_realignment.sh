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

#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_PICARD}AddOrReplaceReadGroups.jar \
#I=${out}110420_I251_FCC007KABXX_L1_index6.marked.bam \
#O=${out}110420_I251_FCC007KABXX_L1_index6.marked2.bam \
#VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true \
#SO=queryname ID=sample1 LB=FCC007KABXX PU=GTCAATTT PL=illumina SM=GTCAATTT 

#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_PICARD}BuildBamIndex.jar \
#INPUT=${out}110420_I251_FCC007KABXX_L1_index6.marked2.bam


#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_PICARD}SortSam.jar \
#SO=coordinate \
#INPUT=${out}110420_I251_FCC007KABXX_L1_index6.marked2.bam \
#OUTPUT=${out}110420_I251_FCC007KABXX_L1_index6.marked.sorted.bam \
#VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true


${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_GATK} \
-T RealignerTargetCreator \
-R ${refdata}.fasta \
-I ${out}110420_I251_FCC007KABXX_L1_index6.marked.sorted.bam \
-nt 4 \
-nct 1 \
-fixMisencodedQuals \
-o ${tmp}H3Aass.bam.list

echo $"Starting realignment and QC"

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${EXE_GATK} -T IndelRealigner \
-R ${refdata}.fasta \
-I ${out}110420_I251_FCC007KABXX_L1_index6.marked.sorted.bam \
--knownAlleles $INDSNPVCF \
--knownAlleles $GINDSNPVCF \
--knownAlleles $DBSNPVCF \
--targetIntervals ${tmp}H3Aass.bam.list \
-o ${out}110420_I251_FCC007KABXX_L1_index6.realign.bam \
-fixMisencodedQuals \
--consensusDeterminationModel USE_READS -LOD 0.4

