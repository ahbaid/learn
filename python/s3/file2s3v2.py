import os
import sys
import boto

# {{{ usage():
def usage():
   print "\nUsage:\n ",sys.argv[0],"<file_name> <s3_bucket_name>\n"
# }}}

# {{{ progress(completed,total):
def progress(completed,total):
   sys.stdout.write('#')
   sys.stdout.flush()
# }}}

# {{{ file2s3(fileName,bucketName):

def file2s3(fileName,bucketName):
   s3=boto.connect_s3()
   bucket=s3.get_bucket(bucketName)
   key=bucket.new_key(fileName)

   print "Uploading", fileName, "to S3 bucket", bucketName

   key.set_contents_from_filename(fileName,cb=progress, num_cb=50)

   print "\n"

# }}}

if __name__ == '__main__':

   if sys.argv.__len__() != 3:
      usage()
   else:

      fname=sys.argv[1]
      s3bucket=sys.argv[2]

      if os.path.isfile(fname):
         file2s3(fname,s3bucket);
      else:
         print "File:",fname,"does not exist!"
