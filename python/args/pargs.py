#!/usr/bin/env python
from __future__ import print_function
import argparse

# Create a parser
ap = argparse.ArgumentParser()
ap.add_argument("x", help="enter a value for x")
ap.add_argument("y", help="enter a value for y")
ap.parse_args()

args=ap.parse_args()
print("Value of x was %s" % args.x)
print("Value of y was %s" % args.y)
