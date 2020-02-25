#!/bin/bash
#PBS -N samtool
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/users/echimusa/AGe_NGS/config.txt

OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}
INDSNPVCF=${indels}

${samtools} mpileup -ugf ${refast} \
${bam}CNV492-1EMI_S63.final.bam \
${bam}DS14-1MYI_S14.final.bam \
${bam}DS15-1JAY_S15.final.bam \
${bam}DS16-1ALU_S16.final.bam \
${bam}DS20-1MIC_S20.final.bam \
${bam}DS-2-1KYL_S2.final.bam \
${bam}DS-5-1KHA_S5.final.bam \
${bam}EE13-1ASH_S58.final.bam \
${bam}EE15-1FAY_S60.final.bam \
${bam}EE22-1HAI_S68.final.bam \
${bam}EE25-1OVA_S71.final.bam \
${bam}EE29-1NTA_S76.final.bam \
${bam}EE31-1CAL_S78.final.bam \
${bam}EE32-1GAB_S79.final.bam \
${bam}EE34-1LUS_S81.final.bam \
${bam}EE35-1ANG_S82.final.bam \
${bam}EE36-1SUK_S83.final.bam \
${bam}EE37-1KAE_S84.final.bam \
${bam}EE38-1ATH_S85.final.bam \
${bam}EE39-1SEB_S86.final.bam \
${bam}EE40-1JAM_S87.final.bam \
${bam}EE-4-1KHA_S49.final.bam \
${bam}EE6-1NOA_S51.final.bam \
${bam}EE7-1MIL_S52.final.bam \
${bam}EIEE-10-1SIN_S31.final.bam \
${bam}EIEE-1-1ALI_S22.final.bam \
${bam}EIEE15-1OTH_S36.final.bam \
${bam}EIEE22-1JEN_S43.final.bam \
${bam}EIEE24-1AZA_S44.final.bam \
${bam}EIEE-3-1LUB_S24.final.bam \
${bam}EIEE-4-1LIS_S25.final.bam \
${bam}EIEE-5-1NIG_S26.final.bam \
${bam}EIEE-7-1ZEN_S28.final.bam \
${bam}EIEE-8-1BOK_S29.final.bam \
${bam}EIEE-9-1ASA_S30.final.bam \
${bam}IS-1-1LIA_S88.final.bam \
${bam}IS-2-1OVA_S89.final.bam \
${bam}IS-4-1EDL_S91.final.bam \
${bam}IS-5-1COD_S92.final.bam \
${bam}NTC-P1_S94.final.bam \
${bam}NTC-PL2_S101.final.bam \
${bam}T24670B_S96.final.bam \
${bam}UU210-1GAB_S74.final.bam | ${EXE_BCFTOOL} call -mv - > ${vcf}ALL.raw.vcf
