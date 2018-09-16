# Ahbaid Gaffoor / Journeys
# Thu 3/15/2012 
# hash.py - Find your group (Python 2)

if __name__ == "__main__":

   import sys

   # We need an arg to process
   if len(sys.argv) < 2:
      print '\n'+sys.argv[0]+' <name>\n'
      exit()
   else:
      name=sys.argv[1].lower() # Lower case only
      x=0
      print ''

   # Run through each letter
   for c in range(name.__len__()):
      o = ord(name[c]) # ordinal value
      print '%(letter)s  %(ordinal)3d' % {'letter':name[c], 'ordinal':o}
      x = x + o # running total of ordinal values

   # Total and modulus
   print '=============='
   print str(x)+' % 16 = '+str(x % 16)+'\n'
      
