import fileinput,os,sys


ARG=sys.argv[1:]
if len(ARG)==5:
 annote_vcf = ARG[0]]
 out = ARG[1]
 gene_file = ARG[2]
 cutoff = int(ARG[3])
 altcut = int(ARG[4])
 for line in filein
elif len(ARG)==3:
 annote_vcf = ARG[0]]
 out = ARG[1]
 cutoff = int(ARG[3])

else:
  print("Argument or parameters are not correct!")

M = ["snp138","Gene.refGene","Func.refGene","ExonicFunc.refGene","SIFT_pred","Polyphen2_HDIV_pred","Polyphen2_HVAR_pred","LRT_pred","MutationTaster_pred","MutationAssessor_pred","FATHMM_pred","RadialSVM_pred","LR_pred","CADD_phred","GERP++_RS","phyloP46way_placental","phyloP100way_vertebrate","SiPhy_29way_logOdds"]

for line in fileinput.input(path):
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
			M = ["snp138","Gene.refGene","Func.refGene","ExonicFunc.refGene","SIFT_pred","Polyphen2_HDIV_pred","Polyphen2_HVAR_pred","LRT_pred","MutationTaster_pred","MutationAssessor_pred","FATHMM_pred","RadialSVM_pred","LR_pred","CADD_phred","GERP++_RS","phyloP46way_placental","phyloP100way_vertebrate","SiPhy_29way_logOdds"]
                        DES = data[7].split(";") 
			B=DES[5].split("=")
			if len(B)!= 2 or "." in B :
				pass
			else:
				T = [data[0],data[1],data[2],data[3]+"/"+data[4]]
				tmp = []
				for m in M:
					for du in DES:
						if du.startswith(m):
							g = du.split("=")
							if len(g)>1:
								tmp.append(g[1])
							else:
								tmp.append(g[0])
				CX = tmp.count("D")
				if CX >= cutoff:
                                	fin.write("\t".join(T+tmp)+"\n")

				else:
					pass
fin.close()
