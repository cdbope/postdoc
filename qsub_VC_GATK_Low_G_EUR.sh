#!/bin/bash
#PBS -N gatk_G_EUR_Low
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

SUB_JOBS=""

for ANC in {1..25}
do
for CHR in {1..22} 
   do
       echo Processing on chromosome ${CHR}
       # read in file with chunk boundary definitions
	SUB_JOBS="${SUB_JOBS}
${ANC} ${CHR}"
done
done
echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt;ANC={1};CHR={2}; . /mnt/lustre/groups/CBBI0818/Team_Sim/SHELL/VC_GATK_Low_G_EUR.sh'
