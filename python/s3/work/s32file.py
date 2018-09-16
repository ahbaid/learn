import os
import boto

# {{{ s32file(bucketName,fileName):

def s32file(bucketName,fileName):
   s3=boto.connect_s3()
   bucket=s3.get_bucket(bucketName)
   key=bucket.get_key(fileName)
   key.get_contents_to_filename('/tmp/'+fileName)

# }}}

if __name__ == '__main__':
   s32file('mysqlbkup-a9db-test-data-na','test.tar.gz')
