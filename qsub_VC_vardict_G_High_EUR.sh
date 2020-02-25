#!/bin/bash
#PBS -N vardict_H_G_E
#PBS -W group_list=largeq
#PBS -q large
#PBS -P CBBI0818
#PBS -l select=20:ncpus=24
#PBS -l walltime=96:00:00


. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

SUB_JOBS=""

for ANC in {26..50}
do
for CHR in {1..22}
   do
       echo Processing on chromosome ${CHR}
       # read in file with chunk boundary definitions
	SUB_JOBS="${SUB_JOBS}
${ANC} ${CHR}"
done
done
echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt;ANC={1};CHR={2}; . /mnt/lustre/groups/CBBI0818/Team_Sim/SHELL/VC_vardict_G_High_EUR.sh'
