#!/bin/bash
#PBS -N indexBamd
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=96:00:00
#PBS -M awanydenis@gmail.com
#PBS -m abe


. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

SUB_JOBS=""

for ANC in 46 48 50
   do
       # read in file with chunk boundary definitions
        SUB_JOBS="${SUB_JOBS}
${ANC}"
done

echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} \
--col-sep ' ' '. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt;ANC={1}; . /mnt/lustre/groups/CBBI0818/Team_Sim/SHELL/indexbam_CEU_high.sh'



