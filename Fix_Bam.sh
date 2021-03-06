#!/bin/bash
#PBS -N Fix_RG
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=96:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

tmp=${wkd}TEMP/


${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} jvm-args -jar ${picard}AddOrReplaceReadGroups.jar \    
	INPUT=${BAM}AFR/High/AFR_26_sim_reads_high_golden.bam \ 
	OUTPUT=${BAM}AFR/High/AFR_26_sim_reads_high_golden.addRG.bam \ 
	SORT_ORDER=coordinate \
	RGID=AFR26 \ 
	RGLB=library1 \ 
	RGPL=illumina \ 
	RGPU=H0164ALXX140820.2 \ 
	RGSM=sample26 \ 
	VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true \

#${samtool} sort -o ${BAM}AFR/High/AFR_26_sim_reads_high_golden.calmd.finalsorted.bam ${BAM}AFR/High/AFR_26_sim_reads_high_golden.calmd.final.bam 

#${samtool} index ${BAM}AFR/High/AFR_26_sim_reads_high_golden.calmd.finalsorted.bam



