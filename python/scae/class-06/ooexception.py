class MyException(Exception): pass


def myfn(n):
    if n==1:
       raise MyException("Caught my exception")
    else:
       1/0


def create_e(n):
   pass

class test(object):
   x=10


a=test()
b=test()

print('a.x:',a.x)
print('b.x:',b.x)

a.x=20
b.x=30
print('a.x:',a.x)
print('b.x:',b.x)


