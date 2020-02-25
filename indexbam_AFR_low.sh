#!/bin/bash

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

#ANC=$1

ID=AFR${ANC}

#echo -e "@RG\tID:ga\tSM:${ID}\tLB:ga\tPL:Illumina" > ${bam}rg.${ANC}.txt
#${samtools} view -h ${BAM}AFR/Low/AFR_26_sim_reads_low_golden.bam | cat ${bam}rg.${ANC}.txt - | awk '{ if (substr($1,1,1)=="@") print; else $

#${samtools} index ${bam}AFR_${ANC}_sim_lowcov_golden.fixed.bam

#${samtools} calmd -Erb ${bam}AFR_${ANC}_sim_lowcov_golden.fixed.bam ${REF}ucsc.hg19.fasta > ${bam}AFR_${ANC}_sim_lowcov_golden.calmd.bam1
#${samtools} index ${bam}AFR_${ANC}_sim_lowcov_golden.calmd.bam

${samtool} view -H ${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.bam | \
sed "s,ID:NEAT,ID:sample_${ANC}\tSM:${ID}\tLB:477\tPL:Illumina,g" | \
${samtool} reheader - \
${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.bam > ${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.fixed.bam

${samtool} index ${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.fixed.bam

#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}AddOrReplaceReadGroups.jar \
#I=${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.bam \
#OUTPUT=${wkd}AFR_${ANC}_sim_lowcov_golden.fixed1.bam \
#ID=sample${ANC} LB=FCC007KABXX PU=GTCAATTT PL=illumina SM=${ID}

${samtool} calmd -Erb ${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.fixed.bam \
${REF}ucsc.hg19.fasta > ${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.calmd.bam
${samtool} index ${BAM}AFR/Low/AFR_${ANC}_sim_reads_low_golden.calmd.bam




#${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}BuildBamIndex.jar \
#$INPUT=${bam}
