#!/bin/bash
#PBS -N algnbope
#PBS -q smp
#PBS -P CBBI1039
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

module add chpc/gnu/parallel-20160422

. /mnt/lustre/users/cbope/AGe_NGS/config.txt
cd /mnt/lustre/users/cbope/AGe_NGS/
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
done </mnt/lustre/users/cbope/AGe_NGS/FASTQ/sample.txt

echo "${SUB_JOBS}"
echo "${SUB_JOBS}" | parallel -j 23 -u --sshloginfile ${PBS_NODEFILE} --col-sep ' ' '. /mnt/lustre/users/cbope/AGe_NGS/config.txt;SAM={1} . /mnt/lustre/users/cbope/AGe_NGS/script/1.ALIGNMENT-2.sh'

