#!/usr/bin/env python

import re, sys

if __name__ == '__main__':

   if len(sys.argv) < 4:
      print("\nUsage %s <magnitude> <month_string> <year>\n" % sys.argv[0])
      sys.exit()

   # Open the file
   magnitude=float(sys.argv[1])
   month=sys.argv[2]
   f=open("earthquakes_"+sys.argv[3]+".txt")
   
   # regular expression buildup
   #regex='^Magnitude 7.*(Ju).*2009$'
   #regex='^Magnitude 7.*\\bJu(ne|ly)+\\b.*2009$'
   #regex='^Magnitude (\d+\.\d+)\s.*\\bJu(ne|ly)+\\b.*2009$'
   #regex='^Magnitude (?P<mag>\d+\.\d+)\s.*\\bJu(ne|ly)+\\b.*2009$'
   #regex='^Magnitude (?P<mag>\d+\.\d+)\s.*\\b'+month+'\s.*$'
   #regex='^Magnitude (?P<mag>\d+\.\d+)\s.*\\b'+month+'.*$'
   
   # Final regular expression
   #regex='^Magnitude (?P<mag>\d+\.\d+)\s.*\\bJu(ne|ly)+\\b.*2009$'
   #regex='^Magnitude (?P<mag>\d+\.\d+)\s.*\\b'+month+'\s.*$'
   regex='^Magnitude (?P<mag>\d+\.\d+)\s.*\\b'+month+'.*$'
   
   # compile the regular expression since we will be searching many lines with the same expression
   compiled_regex=re.compile(regex)
   
   # read the lines
   for line in f:
   
      # Strip off the newline
      eq=line.rstrip('\n')
   
      # Search the line
      
      result=compiled_regex.search(eq)
      if result and float(result.group('mag')) >= magnitude:
         print(eq)
         
   
   # Close the file
   if not f.closed: f.close()
