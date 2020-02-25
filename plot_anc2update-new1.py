import fileinput
import pylab,sys,os,time
import matplotlib.pyplot as plt
from matplotlib import cm
file1=sys.argv[1]
rows = {}

####A =["CAM","African-Caribbean","Niger-Congo_Bantu_South","Niger_Congo_Bantu","Niger_Congo_West","Pharma2_case_update","USA_Indian","European_center","European_USA","South_Asian","Niger_Congo_Volta_Niger","UK_Indian","East_Asian","Latin_American","Pharma2_DRC","European_South","Afro-Asiatic_Cushitic","Pharma2_CAM_update","Afro-Asiatic_Omotic","African-American","European_North","Afro-Asiatic_Semitic"]

###A = ["Niger-Congo_Bantu_South","African-Caribbean","Niger_Congo_Bantu","Afro-Asiatic_Cushitic","Afro-Asiatic","European_USA","East_Asian","Latin_American","Afro-Asiatic_Omotic","European_South","South_Asian ACG.Khoe-San","USA_Indian","Niger_Congo_Volta_Niger","Afro-Asiatic_Semitic","UK_Indian","European_center","African-American","European_North","Niger_Congo_West"]

A = ['African-Caribbean','African-American','Afro-Asiatic_Semitic','Afro-Asiatic_Cushitic','Afro-Asiatic_Omotic','East_Asian','European_North','European_center','European_South','European_USA','Latin_American','Khoe-San','Niger_Congo_Volta_Niger','Niger-Congo_Bantu_South','Niger_Congo_West','Niger_Congo_Bantu','South_Asian','USA_Indian','UK_Indian']

header = []
for line in fileinput.input(file1):
	data = line.strip().split()
	if fileinput.lineno()==1:
		for pop1 in data:
			pop2 = pop1.strip().split("ACG")
			#print(pop2)
			pop = pop2[0]
			header.append(pop)
			if pop in A:
				rows[pop] = []
	else:
		for prop_idx in range(0, len(data)): #remove -1
			if header[prop_idx] in rows:
				rows[header[prop_idx]].append(data[prop_idx])
print(rows)
time.sleep(10)
print(len(rows))
print"\nNumber of Phenotype:",len(rows)
pos=[0.005, 0.1,0.25,0.50,0.75,1.0]
symbols = ['o','o','o','o','o','D','v','v','v','v','v','s','s','s','s','s','-','-','-','-','D','D','D']
####symbols = ['o','o','s','v','s','D','<','>','s','s','D','+','s','s','x','D','s','D','d','-','D','s']
#lps = [k+'-' for k in [',','.','o','^','v','<','>','s','+','x','D','d','1','2','3','4','h','H','p']]
####colors= ['r','r','g','b','g','b','r','r','g','g','b','r','g','g','r','b','g','b','r','g','b','r']
colors= ['b','g','r','k','m','k','b','g','r','k','y','b','g','r','k','y','g','r','k','b','g','r']
#pylab.legend(loc=9, bbox_to_anchor=(0.5, -0.1), ncol=2)
fig=plt.figure(2,dpi=300)
ax = fig.add_subplot(111) #plt.subplot(111)
ax.set_xlabel("Minor Allele Frequency Bin")
ax.set_ylabel("Proportion of MAF")

i  = 0;PHE=[]

for phe in A:
	col= colors[i]+symbols[i]
	PHE.append(phe)
	print"\n",col,phe
#	if i%2 ==0:
	if phe =="African-Caribbean":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="African-American":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Afro-Asiatic_Semitic":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Afro-Asiatic_Cushitic":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Afro-Asiatic_Omotic":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="East_Asian":
                ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="European_North":
                ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="European_center":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="European_South":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="European_USA":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Latin_American":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Khoe-San":
                ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Niger_Congo_Volta_Niger":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Niger-Congo_Bantu_South":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Niger_Congo_West":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="Niger_Congo_Bantu":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="South_Asian":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="USA_Indian":
		ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)
	elif phe =="UK_Indian":
                ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=1)

##	else:
##            	ax.plot(pos,rows[phe],col,linestyle='-.',linewidth=3)
	i = i +1
	#raw_input("STOP")
	#plt.legend()
plt.xticks([0.005, 0.1,0.25,0.50,0.75,1.0],['0-0.05', '>0.05-0.1', '>0.1-0.2', '>0.2-0.3', '>0.3-0.4', '>0.4-0.5'])

plt.grid(True)
plt.tick_params(labelsize=8)
#print(PHE)
# Now add the legend with some customizations.

# The frame is matplotlib.patches.Rectangle instance surrounding the legend.
#frame = legend.get_frame()
#frame.set_facecolor('0.90')
box = ax.get_position()
ax.set_position([box.x0, box.y0 + box.height * 0.4,box.width, box.height * 0.7])
#fig.legend()
####ax.legend(( "Control_CAM","African-Caribbean","Niger-Congo_Bantu_South","Niger_Congo_Bantu","Niger_Congo_West","Patient_SCD","USA_Indian","European_center","European_USA","South_Asian","Niger_Congo_Volta_Niger","UK_Indian","East_Asian","Latin_American","Patient_DRC","European_South","Afro-Asiatic_Cushitic","Patient_CAM","Afro-Asiatic_Omotic","African-American","European_North","Afro-Asiatic_Semitic"),loc='upper center', bbox_to_anchor=(0.5, -0.09),fancybox=True, shadow=True, ncol=3, fontsize=10)

ax.legend(('African-Caribbean','African-American','Afro-Asiatic_Semitic','Afro-Asiatic_Cushitic','Afro-Asiatic_Omotic','East_Asian','European_North','European_center','European_South','European_USA','Latin_American','Khoe-San','Niger_Congo_Volta_Niger','Niger-Congo_Bantu_South','Niger_Congo_West','Niger_Congo_Bantu','South_Asian','USA_Indian','UK_Indian'),loc='upper center', bbox_to_anchor=(0.5, -0.09),fancybox=True, shadow=True, ncol=3, fontsize=10)


###ax.legend((UK_Indian, East_Asian, African-Caribbean, Latin_American, Niger-Congo_Bantu_South, European_USA, Afro-Asiatic_Omotic, Afro-Asia_Cushitic, Niger_Congo_Bantu, Khoe-San, European_South, South_Asian, African-American, Niger_Congo_West, USA_Indian, European_center, Niger_Congo_Volta_Niger, European_North, Afro-Asiatic_Semitic, Pharma2),('UK_Indian','East_Asian','African-Caribbean','Latin_American','Niger-Congo_Bantu_South','European_USA','Afro-Asiatic_Omotic','Afro-Asia_Cushitic','Niger_Congo_Bantu','Khoe-San','European_South','South_Asian','African-American','Niger_Congo_West','USA_Indian','European_center','Niger_Congo_Volta_Niger','European_North','Afro-Asiatic_Semitic','SCD_Patient'))
###,loc='upper center', bbox_to_anchor=(0.5, -0.09),fancybox=True, shadow=True, ncol=3, fontsize=10)

#ax.legend(('Amygdala','BMI', 'Caudate nucleus', 'Height', 'Hippocampus', 'IBD', 'Intracranial volume',   'Nucleus accumbens','Pallidum', 'Putamen',  'Thalamus', 'Type 2 diabetes'),loc='upper center', bbox_to_anchor=(0.5, -0.09),fancybox=True, shadow=True, ncol=3)

fig.savefig("/Users/bope/Documents/Sciences/Postdoc/RSA/Project/ethnic/FRQ/SICKLE_Frq_Prop_27may19_trp.png")
#plt.savefig
