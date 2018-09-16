#!/usr/bin/env python

d={ 'tom':10,
    'jerry':20,
    'bugs':30,
    'daffy':40
  }

print(d)
print(type(d))

for (k,v) in d:
   print("(k,v)=(%s,%s)" % (k,v))
