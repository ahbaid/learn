#!/usr/bin/env python

import sys


def PadToLength(s,l=10,p=' '):
    '''
    Left Pads a string s to length l(default 10) with character p (default space)
    '''
    pad_to = l-len(s)

    if pad_to > 0:
       return p*pad_to + s
    else:
       return s

def main():

   print (len(sys.argv))
   
   if len(sys.argv) == 2:
      print(PadToLength( str(sys.argv[1]) ))
   if len(sys.argv) == 3:
      print(PadToLength( str(sys.argv[1]), int(sys.argv[2]) ))
   elif len(sys.argv) == 4:
      print(PadToLength( str(sys.argv[1]), int(sys.argv[2]), str(sys.argv[3])  ))
   else:
      print (sys.argv[0]+" <string> [<length> [<padto>] ]")

if __name__ == "__main__":
   main()


