import os
import boto

# {{{ listS3files(bucketName):

def listS3files(bucketName):
   s3=boto.connect_s3()
   bucket=s3.get_bucket(bucketName)
   for key in bucket.get_all_keys():
      print key.name, key.__sizeof__()

# }}}

if __name__ == '__main__':
   listS3files('mysqlbkup-a9db-test-data-na')
