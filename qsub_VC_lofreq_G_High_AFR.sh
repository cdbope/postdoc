#!/bin/bash
#PBS -N lofreq_G_H_A
#PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=96:00:00
#PBS -u iallali 


. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

SUB_JOBS=""

for ANC in {35..35}
do
       echo Processing on chromosome ${CHR}
       # read in file with chunk boundary definitions
	SUB_JOBS="${SUB_JOBS}
${ANC}"
done
echo "${SUB_JOBS}" | parallel --tmpdir /mnt/lustre/groups/CBBI0818/Team_Sim/TEMP/ -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt;ANC={1}; . /mnt/lustre/groups/CBBI0818/Team_Sim/SHELL/VC_lofreq_G_High_AFR.sh'
