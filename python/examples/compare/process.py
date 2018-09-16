#!/usr/bin/env python

import sys

if (__name__ == '__main__'):

   # {{{ Functions

   # {{{ def readfile(fname,inlist):
   def readfile(fname):
      inlist=[]
      f=open(fname,'r')
      for line in f:
         inlist.append(line.split(',')[1])
      f.close()
      return inlist
   # }}}

   # {{{ def process_lists(alist,blist)
   def process_lists(alist,blist):

       if alist.__len__() == blist.__len__():

          values=alist.__len__()

          dt=0
          pctd=0
          ctr=0

          maxd=0
          mind=999999999999999999
          maxv=0
          minv=999999999999999999

          atot=0
          btot=0

          for n in range(0,values):

              a=float(alist[n])
              b=float(blist[n])

              if b<a:
                 ctr=ctr+1
                 diff=float(a)-float(b)
                 dt=dt+diff
                 pctd=pctd+round((a-b)/a*100,2)
                 atot=atot+a
                 btot=btot+b

                 if maxd < diff: maxd = diff
                 if mind > diff: mind = diff

                 if maxv < a: maxv = a
                 if minv > a: minv = a

                 print "DATA: "+str(a)+":"+str(b)+":"+str(diff)
              else:
                 print "DATA: "+str(a)+":"+str(b)+" [IGNORED]"

          print sys.argv[1]+" vs. "+sys.argv[2]
          print "n:"+str(ctr)+" avg:"+str(round(dt/ctr,2))+" max:"+str(maxd)+" min:"+str(mind)
          print "Avg % difference: "+str(round(pctd/ctr,2))+" maxmetric:"+str(maxv)+" minmetric:"+str(minv)
          print "a-avg total: "+str(round(atot/ctr,2))+", b-avg total:"+str(round(btot/ctr,2))+", calc % diff:"+str(round((atot-btot)/atot*100,2))+", avg diff:"+str(round(dt/ctr,2))
     
       else:
          print "\nFATAL! List lengths do not match!\n"
          exit()
      
   # }}}

   # }}}

   # {{{ Main 

   if len(sys.argv) < 3:
      print '\n',sys.argv[0]," <file1> <file2>\n"
      exit()

   # First list of values - file 1
   avals=readfile(sys.argv[1])

   # Second list of values - file 2
   bvals=readfile(sys.argv[2])

   # Process lists
   process_lists(avals,bvals)

   # }}}
