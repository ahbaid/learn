import re

f = open('holidays.txt')
line = f.readline()
while line:
   print(line.strip())
   line = f.readline()
f.close()
