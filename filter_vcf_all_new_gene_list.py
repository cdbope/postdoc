import fileinput,os,sys


ARG = sys.argv[1:]

if len(ARG)==5:
	annot_vcf = ARG[0]
	out = ARG[1]
	gene_file = ARG[2]
	cutoff = int(ARG[3])
	altcut = int(ARG[4]) 
	GENE = []
	for line in fileinput.input(gene_file):
		data = line.split()
		GENE.append(data[0].upper())

elif len(ARG)==3:
	annot_vcf = ARG[0]
	out = ARG[1]
	cutoff = int(ARG[-1])
else:
	print("Arguments or parameters are not correct!")
	A = """python filter_vcf_all.py <annotated vcf> <outfile> \ 
<cutoff:integer> """
	B= """python filter_vcf_all.py <annotated vcf> <outfile> \ 
<genelist in1 column> \
 <cutoff:integer>  <alt cutoff: integer>"""	
	print("With 3 parameters:" +" "+ A)
	print("\n")
	print("With 5 parameters:" +" "+ B)
	print("\n")
	print("Good day!")
	sys.exit(1)

fin=open(out,"wt")

M = ["avsnp147","Func","Gene","ExonicFunc","AAChange","1000g2015aug_afr","1000g2015aug_eas","1000g2015aug_eur","GME_AF","GME_NWA","GME_NEA","GME_AP","GME_Israel","GME_SD","GME_TP","GME_CA","REVEL","ExAC_AFR","ExAC_AMR","ExAC_EAS","ExAC_FIN","ExAC_NFE","ExAC_OTH","ExAC_SAS","ExAC_nonpsych_AFR","ExAC_nonpsych_AMR","ExAC_nonpsych_EAS","ExAC_nonpsych_FIN","ExAC_nonpsych_NFE","ExAC_nonpsych_OTH","ExAC_nonpsych_SAS","ExAC_nontcga_AFR","ExAC_nontcga_AMR","ExAC_nontcga_EAS","ExAC_nontcga_FIN","ExAC_nontcga_NFE","ExAC_nontcga_OTH","ExAC_nontcga_SAS","dbscSNV_ADA_SCORE","dbscSNV_RF_SCORE","InterVar_automated","PVS1","CLNALLELEID","CLNDN","CLNDISDB","CLNREVSTAT","CLNSIG","nci60","SIFT_pred","Polyphen2_HDIV_pred","Polyphen2_HVAR_pred","LRT_pred","MutationTaster_pred","MutationAssessor_pred","FATHMM_pred","RadialSVM_pred","LR_pred","CADD_phred"]
GE = ["Func","Gene","ExonicFunc","AAChange"]
ME = ["SIFT_pred","Polyphen2_HDIV_pred","Polyphen2_HVAR_pred","LRT_pred","MutationTaster_pred","MutationAssessor_pred","FATHMM_pred","RadialSVM_pred","LR_pred","CADD_phred"]

for line in fileinput.input(annot_vcf):
		data = line.split()
                if line.startswith("#"):
			if line.startswith("#CHROM"):
                        	#if CHR==1:
				A = "A1/A2"
				D = [data[0],data[1],"SNP",A]+M
                                fin.write("\t".join(D)+"\n")
				L = len(D)
				print"\n",D,L
                else:
                        DES = data[7].split(";") 
			B=DES[5].split("=")
			if data[6]=="PASS":
				T = [data[0],data[1],data[2],data[3]+"/"+data[4]]
				tmp = [];ME1 = [];BIS = []
				for m in M:
					for du in DES:
						if du.startswith(m):
							g = du.split("=")
							if len(g)>1:
								if m in ME:
									ME1.append(g[1])
								if m in BIS:
									pass
								else:
									BIS.append(m)
									tmp.append(g[1])
							else:
								if m in ME:
									ME1.append(g[0])

								if m in BIS:
                                                                        pass
                                                                else:
									BIS.append(m)
									tmp.append(g[0])
				CX = ME1.count("D")
				#print(ME1);print(len(ME1))
				if CX >= cutoff:
                                	fin.write("\t".join(T+tmp)+"\n")
				elif "Likely_pathogenic" in tmp or "Pathogenic" in tmp:
					fin.write("\t".join(T+tmp)+"\n")
				else:
					if len(ARG)==5:
						if tmp[2].upper() in GENE:
							if CX >= altcut:
								fin.write("\t".join(T+tmp)+"\n")
fin.close()
