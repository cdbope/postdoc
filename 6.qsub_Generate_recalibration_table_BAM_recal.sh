#!/bin/bash
#PBS -N recab
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
while read line
do
  	SAM=$line
  	((i++))
  	arr=$(echo $line | tr "." "\n")
  	set -- $arr
  	datas=( $arr )
	SUB_JOBS="${SUB_JOBS}
${datas}"
done </mnt/lustre/users/echimusa/AGe_NGS/FASTQ_AGE/emile.txt

echo "${SUB_JOBS}"
echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/users/echimusa/AGe_NGS/config.txt;SAM={1} . /mnt/lustre/users/echimusa/AGe_NGS/script/6.Generate_recalibration_table_BAM_recal.sh'
