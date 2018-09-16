import boto
s3=boto.connect_s3()
s3.create_bucket('mysqlbkup-a9db-prod-data-na')
s3.create_bucket('mysqlbkup-a9db-test-data-na')
