import boto

# {{{ dels3file(fileName,bucketName):

def dels3file(fileName,bucketName):
   s3=boto.connect_s3()
   bucket=s3.get_bucket(bucketName)
   bucket.delete_key(fileName)

# }}}

if __name__ == '__main__':
   dels3file('test.tar.gz','mysqlbkup-ahg-test-data-na')
