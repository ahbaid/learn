#!/usr/bin/env python
from __future__ import print_function
import argparse

# Create a parser
ap = argparse.ArgumentParser()

# Add two required args, of type int
ap.add_argument("x", help="enter a value for x", type=int)
ap.add_argument("y", help="enter a value for y", type=int)

# Add an option arg, used as a signal or flag, with short and long forms
ap.add_argument("-v", "--verbose", help="be verbose", action="store_true")

# Add an arg, optional, but with restricted choices
ap.add_argument("-s", "--smiles", type=int, choices=[1,2,3], help="how many smiley faces to show")

# Parse the args
ap.parse_args()

args=ap.parse_args()
sum=args.x+args.y

if args.verbose:
   print("The value of x is %s" % args.x)
   print("The value of y is %s" % args.y)
   print("The sum of {} + {} is {}".format(args.x,args.y,sum))
else:
   print("x=%s" % args.x)
   print("y=%s" % args.y)
   print("{}+{}={}".format(args.x,args.y,sum))

if args.smiles:
   for i in range(0,args.smiles):
      print(":)")
