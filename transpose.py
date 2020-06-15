import fileinput,sys,os

rows = {}
for line in fileinput.input(sys.argv[1]):
	data = line.split()
	rows[data[0]]= data
	if fileinput.lineno() ==1:
		L = len(data)
D = rows.values()
fin = open(sys.argv[2],"wt")
for  j in range(L):
	for i in range(len(D)):
		fin.writelines(D[i][j]+"\t")
	fin.write("\n")
fin.close()
