#!/usr/bin/env python3

from sys import argv

with open(argv[1], "rb") as inputfile:
    data = inputfile.read()
    
size = 256
if len(argv) > 2:
    size = int(argv[2])
    
separator = f";;{{w:8,h:8,bpp:1,count:{size},brev:1,np:2,pofs:8,remap:[0,1,2,4,5,6,7,8,9,10,11,12]}};;"

n = 0
line = []
lines = 0
print('.segment "CHARS"')
for c in data:
    n += 1
    line.append(f"${c:0{2}X}")
    if n == 8:        
        if lines == 0:
            print(separator)    
        print(".byte " + ",".join(line))
        n = 0; line = []
        lines += 1
    if lines == size * 2:
        print(";;")
        lines = 0
