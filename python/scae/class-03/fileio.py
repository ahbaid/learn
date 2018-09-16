#!/usr/bin/env python

'''

file modes: 'r','w','a' and more!

f1andle=open('filename','filemode')


f1.readline()
f1.readlines()
f1.writeline()
f1.wrtielines()

f1.closed
f1.mode

for line in f1:
   # process line

f1.close()

'''

f1=open('fruits.txt','r')
f2=open('fruits_upper.txt','w')

for line in f1: 
   print(line.rstrip('\n'))
   f2.writelines(line.upper())

if not f1.closed: f1.close()
if not f2.closed: f2.close()
