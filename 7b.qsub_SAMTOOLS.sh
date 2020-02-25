#!/bin/bash
#PBS -N samvcf
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

module add chpc/gnu/parallel-20160422

. /mnt/lustre/users/echimusa/AGe_NGS/config.txt
cd /mnt/lustre/users/echimusa/AGe_NGS/
i=0
IFS=" "
SUB_JOBS=""
for CHR in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 118 19 20 21 22 X Y M
do
	SUB_JOBS="${SUB_JOBS}
${CHR}"
done

echo "${SUB_JOBS}"
echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/users/echimusa/AGe_NGS/config.txt;CHR={1} . /mnt/lustre/users/echimusa/AGe_NGS/script/7b.SAMTOOLS.sh'
