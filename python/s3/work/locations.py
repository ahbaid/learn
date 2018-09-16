import boto
s3=boto.connect_s3()
Locations=dir(boto.s3.connection.Location())
for l in Locations: print l
