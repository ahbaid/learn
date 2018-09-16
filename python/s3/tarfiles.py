import os
import tarfile

# {{{ tarDir(dirName, tarFile):

def tarDir(dirName, tarFile):
    
   files = os.listdir(dirName)

   if files.__len__():

      newtar=tarfile.open(tarFile,"w:gz")

      for fname in files:
         print fname
         newtar.add(fname)

      newtar.close()

# }}}

if __name__ == '__main__':
   tarDir('/Users/ahbaid/s3','test.tar.gz')
