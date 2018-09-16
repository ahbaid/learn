#!/usr/bin/env python
import sys
import re

if __name__ == '__main__':
   
   s="Magnitude 5.2 ISLAND OF HAWAII, HAWAII April 14, 2009"

   # Finds all numbers separated by any character
   regex='\d+'

   # Finds all numbers separated by any character
   regex='(\d+).?(\d+)'

   print("%s%s%s%s%s%s%s" % ("\n","="*50,"\n","Testing regex: ",regex,"\n","="*50))

   print("%s%s%s%s" % ("\n","re.search()","\n","="*20))
   match=re.search(regex,s)
   print("match.group() : ", match.group())
   print("match.groups() : ", match.groups())

   print("%s%s%s%s" % ("\n","re.findall()","\n","="*20))
   match=re.findall(regex,s)
   print(match)
   for m in match:
      print(m)


   

