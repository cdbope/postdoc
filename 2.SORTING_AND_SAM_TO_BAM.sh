#!/bin/bash
#PBS -N sortbope
#PBS -q smp
#PBS -P CBBI1039
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00


. /mnt/lustre/users/cbope/AGe_NGS/config.txt

	
${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${picard}SortSam.jar \
SO=coordinate \
INPUT=${BAM}110420.sam \
OUTPUT=${BAM}110420.sorted.bam \
VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true


