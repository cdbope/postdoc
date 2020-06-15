import fileinput,os,sys


#path=sys.argv[1]

#pop=sys.argv[2]

fin=open("/home/mnynol006/HL/Multitianno.mut_PATIENT.vcf","wt")

H = ["snp138","refGene","Func.Gene","ExonicFunc","SIFT","HDIV","HVAR","LRT","MutationTaster",
"MutationAssessor","FATHMM","RadialSVM","LR","CADD","GERP","phyloP46way","phyloP100way","SiPhy_29way_logOdds"]

#for CHR in range(1,23):
for line in fileinput.input("/home/mnynol006/HL/HL.vcf.hg19_multianno.vcf"):
		data = line.split()
                if line.startswith("#"):
			if line.startswith("#CHROM"):
                        	#if CHR==1:
				A = "A1/A2"
				D = [data[0],data[1],"SNP",A]+H
                                fin.write("\t".join(D)+"\n")
				L = len(D)
				print"\n",D,L
				#else:
				#	pass
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
				#print"\n",tmp,len(tmp)
				#raw_input("STOP")

				if "." in tmp or len(tmp) != 18:
					pass
				else:
					if CX >= 4 and float(tmp[-1])>10.0:
						if len(T)+len(tmp)==L:	
                                			fin.write("\t".join(T+tmp)+"\n")
						else:
							print"\nInconsistancy!!!!"

					else:
						pass
fin.close()
