#!/usr/bin/env python

def exampleFunc(a, b, **other):
   print("args passed in are a=%s, b=%s" % (a,b))
   print("other is a dict with keys:", other.keys())

exampleFunc(1,2,c=3,d=4,e=5)
