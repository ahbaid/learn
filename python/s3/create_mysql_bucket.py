import boto
s3=boto.connect_s3()
s3.create_bucket('mysqlbkup-ahg-prod-data-na')
s3.create_bucket('mysqlbkup-ahg-test-data-na')
