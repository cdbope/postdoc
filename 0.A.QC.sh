#PBS -N algn
#PBS -q smp
#PBS -P CBBI0818

#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00


. /mnt/lustre/users/slagu/AGe_NGS/config.txt


${fastqc} -t 12 ${fastq}*.fastq.gz -o ${FASTATS}
