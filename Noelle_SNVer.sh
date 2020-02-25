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
pool=/mnt/lustre/groups/CBBI0818/NOELLE/SHELL/poolfiles/pool.txt


#AFR -lowcov
#out=${VCF}SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${BAM}NEW/AFR/AFR_${ANC}_altcov_final.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}AFR_${ANC}_lowcov.SNVer

#-l  ## to have with bed regional file 

#AFR - highcov
out=${VCF}SNVer/
${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
-i ${BAM}NEW/AFR/AFR_${ANC}_final.bam \
-r ${REF}ucsc.hg19.fasta \
-c ${pool} \
-o ${out}AFR_${ANC}_highcov.SNVer

#EUR - lowcov
#out=${VCF}SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${BAM}NEW/EUR/EUR_${ANC}_final.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}EUR_${ANC}_lowcov.SNVer

#EUR -highcov
#out=${VCF}SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${BAM}NEW/EUR/EUR_${ANC}_altcov_final.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}EUR_${ANC}_highcov.SNVer

#AFR - Golden lowcov
#out=${VCF}GOLDEN/SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${outsim}NEW/AFR/AFR_${ANC}_sim_lowcov_golden.fixed.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}AFR_${ANC}_lowcov_golden.SNVer

#AFR - Golden highcov
#out=${VCF}GOLDEN/SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${outsim}NEW/AFR/AFR_${ANC}_sim_highcov_golden.fixed.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}AFR_${ANC}_highcov_golden.SNVer

#EUR - Golden lowcov
#out=${VCF}GOLDEN/SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${outsim}NEW/EUR/EUR_${ANC}_sim_lowcov_golden.fixed.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}EUR_${ANC}_lowcov_golden.SNVer

#EUR - Golden highcov
#out=${VCF}GOLDEN/SNVer/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${snver} \
#-i ${outsim}NEW/EUR/EUR_${ANC}_sim_highcov_golden.fixed.bam \
#-r ${REF}ucsc.hg19.fasta \
#-c ${pool} \
#-o ${out}EUR_${ANC}_highcov_golden.SNVer


