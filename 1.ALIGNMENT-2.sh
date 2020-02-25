#!/bin/bash
#PBS -N algnbope
#PBS -q smp
#PBS -P CBBI1039
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00


. /mnt/lustre/users/cbope/AGe_NGS/config.txt

####header=$(cat $1 | head -n 1)
####sm=$(echo $header | head -n 1 | grep -Eo "[ATGCB]+$") 

#SAM=EE32-1GAB_S79
#${bwa} index -a bwtsw ${refdata}.fasta 
#RG="@RG\tID:${SAM}\tLB:FCC007KABXX\tSM:CGTTATGC\tPL:Illumina"
# "@RG\tID:${SAM}\tLB:FCC007KABXX\tSM:CGTTATGC\tPL:Illumina\tPU:run\"
#echo "Read Group @RG\tID:$id\tSM:$id"_"$sm\tLB:$id"_"$sm\tPL:ILLUMINA"
#SAM=DS-1-1LUN_S1
#${bwa} mem -R $(echo "@RG\tID:${SAM}\tLB:FCC007KABXX\tSM:CGTTATGC\tPL:Illumina") -M -t 32 ${refast} ${fastq}${SAM}_L001_R1_001.fastq ${fastq}${SAM}_L001_R2_001.fastq > ${sam}${SAM}.sam


######${bwa} mem -R $(echo "@RG\tID:${SAM}\tLB:FCC007KABXX\tSM:$sm\tPL:Illumina") -M -t 32 ${refast} ${fastq}${SAM}_L001_R1_001.fastq ${fastq}${SAM}_L001_R2_001.fastq > ${sam}${SAM}.sam
if [ ! -f "${sam}${SAM}.sam.giz" ]; then
${bwa} mem  -M -t 16 ${refast} ${fastq}${SAM}_L001_R1_001.fastq ${fastq}${SAM}_L001_R2_001.fastq > ${sam}${SAM}.sam
gzip ${sam}${SAM}.sam
fi
#mem -R \"@RG\tID:sample1\tLB:FCC007KABXX\tSM:GTCAATTT\tPL:Illumina\tPU:run\"
