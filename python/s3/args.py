if __name__ == '__main__':

   import sys

   print "Length os sys.argv is:", sys.argv.__len__()

   i=0
   for arg in sys.argv:
      print "sys.argv["+str(i)+"]:",arg
      i+=1

