#!/usr/bin/env python

import re

# Open the file
f=open("earthquakes_2009.txt","r")

# regular expression
regex='^Magnitude 7.*(Ju).*2009$'

# read the lines
for line in f:

   # Strip off the newline
   eq=line.rstrip('\n')

   # Search the line
   if re.search(regex,eq):
      print(eq)
   

# Close the file
if not f.closed: f.close()
