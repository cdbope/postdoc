#!/bin/bash
#PBS -N gatk
#PBS -q smp
#PBS -P CBBI0818
#PBS -l select=1:ncpus=24
#PBS -l walltime=48:00:00

. /mnt/lustre/groups/CBBI0818/Team_Sim/config.txt

OMNIVCF=${omni}
KGVCF=${confi}
DBSNPVCF=${dbsnp}

#ANC = 10, 15, 20
#AFR - Golden - Low Cov
out=${VCF}GOLDEN/GATK/
${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
-T HaplotypeCaller \
-R ${REF}ucsc.hg19.fasta \
-I ${outsim}NEW/AFR/AFR_${ANC}_sim_reads_altcov_golden.bam \
--filter_bases_not_stored \
--dontUseSoftClippedBases \
--filter_mismatching_base_and_quals \
--emitRefConfidence GVCF \
--filter_reads_with_N_cigar \
--genotyping_mode DISCOVERY \
-stand_call_conf 30 \
-stand_emit_conf 30 \
-L chr${CHR} \
-nct 4 \
-variant_index_type LINEAR -variant_index_parameter 128000 \
-o ${out}AFR_${ANC}_lowcov_golden.GATK.${CHR}.g.vcf

#EUR - Golden - High Cov 
#out=${VCF}GOLDEN/GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${outsim}NEW/EUR/EUR_${ANC}_sim_reads_altcov_golden.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}EUR_${ANC}_lowcov_golden.GATK.${CHR}.g.vcf

#AFR - Golden - High Cov
#out=${VCF}GOLDEN/GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${outsim}NEW/AFR/AFR_${ANC}_sim_read_golden.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}AFR_${ANC}_highcov_golden.GATK.${CHR}.g.vcf

#EUR - Golden - Low Cov
#out=${VCF}GOLDEN/GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${outsim}NEW/EUR/EUR_${ANC}_sim_reads_golden.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}EUR_${ANC}_lowcov_golden.GATK.${CHR}.g.vcf



#AFR - Low Cov
#out=${VCF}GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${BAM}NEW/AFR/AFR_${ANC}_altcov.realign.final.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}AFR_${ANC}_lowcov.GATK.${CHR}.g.vcf

#*******DONE******EUR -Low Cov
#out=${VCF}GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${BAM}NEW/EUR/EUR_${ANC}.realign.final.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}EUR_${ANC}_lowcov.GATK.${CHR}.g.vcf


##*******DONE******AFR -High Cov
#out=${VCF}GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${BAM}NEW/AFR/AFR_${ANC}.realign.final.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}AFR_${ANC}_highcov_.GATK.${CHR}.g.vcf


#EUR - High Cov
#out=${VCF}GATK/
#${EXE_JAVA} -Xmx8g -XX:ParallelGCThreads=1 -Djava.io.tmpdir=${tmp} -jar ${gatk} \
#-T HaplotypeCaller \
#-R ${REF}ucsc.hg19.fasta \
#-I ${BAM}NEW/EUR/EUR_${ANC}_altcov.realign.final.bam \
#--dontUseSoftClippedBases \
#--filter_bases_not_stored \
#--filter_mismatching_base_and_quals \
#--emitRefConfidence GVCF \
#--filter_reads_with_N_cigar \
#--genotyping_mode DISCOVERY \
#-stand_call_conf 30 \
#-stand_emit_conf 30 \
#-L chr${CHR} \
#-nct 4 \
#-variant_index_type LINEAR -variant_index_parameter 128000 \
#-o ${out}EUR_${ANC}_highcov.GATK.${CHR}.g.vcf


