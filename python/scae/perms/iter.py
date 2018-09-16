#!/usr/bin/env python
import sys, itertools, getopt

if __name__ == "__main__":

   ######################################
   # Runtime variables
   ######################################

   # Change this to the number of codes to generate combinations for
   CodeCombinations=2
   
   # Change this to the directory where codes, permutations and combinations files can be found
   mydir="/home/ahbaid/python/scae/perms/"
   mydir=""
   
   # File names for codes, permutations and combinations files
   codes=mydir+"codes.txt"
   pfile=mydir+"permutations.txt"
   cfile=mydir+"combinations.txt"

   ######################################
   # Read codes for processing
   ######################################
   
   # Open the file read only
   codefile=open(codes,"r")
   
   # Initialize an empty codelist
   codelist=[]
   
   # Read each line, strip off the newline character and append it to the codelist
   for line in codefile:
       codelist.append(line.rstrip('\n'))
   
   # Close the file
   codefile.close()
   
   # Print the list we are processing
   print("\nList:")
   print("-----")
   print(str(codelist).replace('[','').replace(']','').replace("'",'').replace(' ','')+'\n')
      
   
   ######################################
   # Process permutations
   ######################################
   
   # Open permutations output file
   pf=open(pfile,"w")
   
   # Print the permutations
   print("Permutations:")
   print("-------------")
   for p in itertools.permutations(codelist):
       print(str(p).replace('(','').replace(')','').replace(' ','').replace("'",''))
       pf.write(str(p).replace('(','').replace(')','').replace(' ','').replace("'",'')+'\n')
   
   # Close permutations file
   pf.close()
   print("\nPermutations are in: %s\n" % pfile)
   
   ######################################
   # Process combinations
   ######################################
   
   # Open combinations output file
   cf=open(cfile,"w")
   
   # Print the combinations for two codes
   print("Combinations:")
   print("-------------")
   for c in itertools.combinations(codelist,CodeCombinations):
       print(str(c).replace('(','').replace(')','').replace(' ','').replace("'",''))
       cf.write(str(c).replace('(','').replace(')','').replace(' ','').replace("'",'')+'\n')
   
   # Close combinations file
   cf.close()
   print("\nCombinations are in: %s" % cfile)
