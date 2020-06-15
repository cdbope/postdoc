import fileinput,os,sys


path=sys.argv[1]
pop=sys.argv[2]
cutoff=int(sys.argv[3])

fin=open(pop,"wt")

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
