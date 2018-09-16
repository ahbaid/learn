#!/usr/bin/env python
import sys

if (len(sys.argv)!=2): exit()
n=int(sys.argv[1])

i=0

while i<n:

   if i==20: 
      print("counter [i] == 20, breaking loop")
      break

   print(i)

   i+=1

else:
   # run if no break was hit
   print("counter did not become 20")
