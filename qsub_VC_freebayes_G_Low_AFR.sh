#!/bin/bash
#PBS -N freebayes_G_L_A
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00


. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

SUB_JOBS=""

for CHR in {22..22} 
   do
       echo Processing on chromosome ${CHR}
       # read in file with chunk boundary definitions
	SUB_JOBS="${SUB_JOBS}
${CHR}"
done

echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt;CHR={1}; . /mnt/lustre/groups/CBBI0818/Team_Sim/SHELL/VC_freebayes_G_Low_AFR.sh'
