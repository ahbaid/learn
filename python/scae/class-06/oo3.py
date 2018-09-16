class MyClass1(object):
   '''public attribute'''
   x=10

   '''privat attribute'''
   __y=20


   def printY(self):
      print(self.__y)

   
   def __hidden(self):
      '''Hidden Methid, can only be called within class'''
      print('Now calling __hidden')

   def call_hidden(self):
      self.__hidden()

a=MyClass1()
a.printY()
a.call_hidden()

print('Is a an instance of class MyClass1:',isinstance(a,MyClass1))
