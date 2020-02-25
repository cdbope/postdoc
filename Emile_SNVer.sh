#!/bin/bash
#PBS -N SNVer
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt
OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}

#bam=/mnt/lustre/groups/CBBI0818/NOELLE/Simulation/OUTPUT/AFR/
bam=/mnt/lustre/groups/CBBI0818/NOELLE/BAM/NEW/AFR/
out=${VCF}GOLDEN/SNVer/
pool=/mnt/lustre/groups/CBBI0818/NOELLE/SHELL/pool.txt

${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
-i ${bam} -r ${REF}ucsc.hg19.fasta \
-c ${pool} \
-o ${out}AFR_golden.SNVer

#-l  ## to have with bed regional file 
