#!/bin/bash
#PBS -N GenoCaller3
####PBS -W group_list=largeq
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/NOELLE/config.txt


HAPMAPVCF=${hapmap}
OMNIVCF=${omni}
KGVCF=${Conf}
DBSNPVCF=${dbsnp}
GINDSNPVCF=${Mills}
INDSNPVCF=${Indel}


in=${BAM}110420.realign.final.bam

out=${VCF}

tmp=${wkd}TEMP/



${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T HaplotypeCaller \
#-R ${REF}.fasta \
#-I ${in} \
#--dbsnp $DBSNPVCF \
#-stand_call_conf 50.0 \
#-stand_emit_conf 10.0 \
#--genotyping_mode DISCOVERY \
#--annotation Coverage \
#--annotation QualByDepth \
#--annotation FisherStrand \
#--annotation RMSMappingQuality \
#--annotation MappingQualityRankSumTest \
#--annotation ReadPosRankSumTest \
#--annotation StrandOddsRatio \
#--annotation MappingQualityZeroBySample \
#--annotation StrandBiasBySample \
#--annotation InbreedingCoeff \
#--annotation BaseQualityRankSumTest \
#--annotation ChromosomeCounts \
#--annotation DepthPerAlleleBySample \
#--annotation HaplotypeScore \
#--annotation MappingQualityZero \
#--annotation SpanningDeletions \
#--annotation TandemRepeatAnnotator \
#-L chr${CHR} \
#-nt 1 \
#-nct 1 \
#-o ${out}110420.${CHR}.vcf

#Apply the filter to the SNP call set

${EXE_JAVA} -Xmx2g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T VariantFiltration \
-R ${REF}.fasta \
-V ${out}110420.${CHR}.vcf \
--filterExpression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
--filterName "snp_filter" \
-o ${out}110420.${CHR}.filtered.vcf


