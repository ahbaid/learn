#!/usr/bin/env python
import sys
import re

if __name__ == '__main__':
   
   s="Magnitude 7.2 ISLAND OF HAWAII, HAWAII July 14, 2009"

   # Finds all numbers separated by any character
   regex='\d+'

   # Finds all numbers separated by a decimal character
   regex='(\d+).?(\d+)'

   # Finds all 
   regex='^Magnitude 7.*(Ju).*2009$'

   cregex=re.compile(regex)
   result=cregex.search(s)

   if result:
      print('Matched!')
   else:
      print('No Match!')


   

