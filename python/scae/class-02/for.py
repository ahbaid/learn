#!/usr/bin/env python 
import sys
from time import sleep

if (len(sys.argv)!=2): 
   print(sys.argv[0]," n")
   exit()
else:
   n=int(sys.argv[1])

# {{{ for loop to process a list

l=[1,2,3,'stop',4,5]

for x in l:
    if x == 'stop':
       print("STOP encountered!")
       break
    else:
       print(x)

# }}}

# {{{ for loop using a range statement to print dots

for x in range(0,n): 
    print('.',end='')
    sys.stdout.flush()
    sleep(1)
print()

# }}}
