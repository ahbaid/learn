class MyClass1(object):
   '''this class has no attributes'''
   pass

class MyClass2(object):
   '''this class has attributes'''
   x=20

   def printHello(self):
       print('Hello from class MyClass2')


if __name__ == '__main__':

   # Create an instance a of MyClass1
   a=MyClass1()

   # Try to print a.x which does not exist
   try:
      print('a.x=',a.x)
   except AttributeError as e:
      print('Exception:', e)

   # Create an attribute in MyClass1
   MyClass1.x = 10

   # Create a new instance b of MyClass1
   b=MyClass1()
   print('b.x=',b.x) # shopuld print 10


   # Create an instance c of MyClass2
   c=MyClass2()

   c.printHello()
