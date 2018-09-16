import os
import boto

# {{{ file2s3(fileName,bucketName):

def file2s3(fileName,bucketName):
   s3=boto.connect_s3()
   bucket=s3.get_bucket(bucketName)
   key=bucket.new_key(fileName)
   key.set_contents_from_filename(fileName)

# }}}

if __name__ == '__main__':
   file2s3('test.tar.gz','mysqlbkup-a9db-test-data-na')
