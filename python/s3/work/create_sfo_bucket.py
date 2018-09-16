import boto
s3=boto.connect_s3()
s3.create_bucket('a9db-sfo-data',location='us-west-1')
s3.create_bucket('a9db-sfo-log',location='us-west-1')
