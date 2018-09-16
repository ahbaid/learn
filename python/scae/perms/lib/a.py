#!/usr/bin/env python
import sys, getopt

if __name__ == "__main__":

   ######################################
   # Usage function
   ######################################
   def usage(program):
       print("\n%s usage:" % program)
       print(" -h|--help")
       print(" -i|--ifile=<input_file> -p|--pfile=<permutations_file> -c|--cfile=<combinations_file> -n <combination size>")
       print(" Note: Combination Size must be greater than 1\n")
   
   ######################################
   # Input validation and extraction
   ######################################
   
   # We must have arguments
   if len(sys.argv[1:])==0: 
      usage(sys.argv[0])
      sys.exit()
   
   # Call getopt for argument processing
   try:
      ArgList, ExtraArgsList = getopt.getopt(sys.argv[1:],'hi:p:c:n:',["help","ifile=","pfile=","cfile="])
   except getopt.GetoptError:
      usage(sys.argv[0])
      sys.exit()
   
   # Extract the arguments and argument values
   for a, aval in ArgList:
      if a in ("-h","--help"):
         usage(sys.argv[0])
         sys.exit()
      elif a in ("-i","--ifile"): 
         ifile=aval
      elif a in ("-p","--pfile"): 
         pfile=aval
      elif a in ("-c","--cfile"): 
         cfile=aval
      elif a in ("-n"):
         CombinationSize=int(aval)
      else:
         usage(sys.argv[0])
         sys.exit()
   
   # Validate all arguments were passed
   try:
      if ifile=='' or pfile=='' or cfile=='' or CombinationSize=='': pass
   except NameError:
      usage(sys.argv[0])
      sys.exit()
   
   # Validate CombiantionSize
   if CombinationSize<2:
      usage(sys.argv[0])
      sys.exit()
   
   # Print some information:
   print("\nInfo:\n=====")
   print("Input file: "+ifile)
   print("Permutations file: "+pfile)
   print("Combinations file: "+cfile)
   print("Combination Size: "+str(CombinationSize)+"\n")
