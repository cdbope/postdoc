#!/usr/bin/python -u
"""
input: two or more files with rsid in the first column
output: rsids common to all

Dumps a list of rsids that are present in all the give lists.
"""
import sys
import os
from sets import *

import gzip

if len(sys.argv) < 2:
    print "Usage: %s inputfile_1 ... <inputfile_n> outputfile"%sys.argv[0]
    exit()

INFILENAMES = sys.argv[1:-1]
OUTFILENAME = sys.argv[-1]

all = Set()

file1 = open(sys.argv[1])
print "Reading %s"%file1.name
for line in file1:
    if line.startswith("CHRM"):
       pass
    else:
         rsid = line.strip().split()[1]
         all.add(rsid)
file1.close()

for filename in INFILENAMES[1:]:
    print "Reading %s"%filename
    newset = Set()
    file = open(filename)
    for line in file:
        if line.startswith("CHRM"):
           pass
        else:
           rsid = line.strip().split()[1]
           newset.add(rsid)
    file.close()
    all = all & newset

fout = open(OUTFILENAME,"wt")
for line in all:
    fout.write(line+"\n")
fout.close()
~                                    
