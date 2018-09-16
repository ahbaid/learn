import boto

if (__name__ == '__main__'):

   s3=boto.connect_s3()
   
   bucket_list=s3.get_all_buckets()
   print "Found",bucket_list.__len__(),"buckets."
   
   for bucket in bucket_list:
       print bucket.name, bucket.get_location()
