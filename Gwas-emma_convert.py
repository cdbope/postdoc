import fileinput,sys,os


fin = open(sys.argv[1],"wt")
fin.write("\t".join(["CHR","POS","SNP","BP","P_value"])+ "\n")

rows = {}

for line in fileinput.input("WTS_H3Africa_Wonkam_HbF-22may19_QC.bim"):
        data = line.split()
        snp = data[1]
        rows[snp]= data
#       print data[3]
for line in fileinput.input("WTS_H3Africa_Wonkam_HbF-22may19_QC_.Emmax.ps"):
        data = line.split()
        snp = data[0]
    #    print(rows[data[0]])
        if data[0] in rows:
              snp  = data[0]
              pv = data[2]
              chrm = rows[snp][0]
              bp = rows[snp][3]
              fin.write("\t".join([chrm, bp, snp ,pv]) +"\n")

fin.close()
                                                               
