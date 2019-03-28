import os
from sets import *

import gzip

if len(sys.argv) < 2:
    print "Usage: %s inputfile_1 ... <inputfile_n> outputfile"%sys.argv[0]
    exit()

INFILENAMES = sys.argv[1:-1]
OUTFILENAME = sys.argv[-1]
rows = {}
file1 = open(sys.argv[1])
print "Reading %s"%file1.name
for line in file1:
        if not line.strip(): continue
        data = [s.strip() for s in line.split()] #remove space
        if data[1] in rows:
                rows[data[-1]].append(data[:-1])
        else:
                rows[data[-1]]=[data[:-1]]
file1.close()
