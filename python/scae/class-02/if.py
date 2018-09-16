#!/usr/bin/env python
import sys

if (len(sys.argv)!=2): 
   print()
   print(sys.argv[0]," n")
   print(" - n : integer ")
   print()
   exit()

b=int(sys.argv[1])

if (b<0):
   print (b," is -ve")
elif (b==0):
   print(b," is zero")
else:
   print(b," is +ve")

