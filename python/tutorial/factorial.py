#!/usr/bin/python

def factorial(n):
   if (n==0):
      return 1
   else:
      return n*factorial(n-1)

def testf():
   y=factorial(3)
   print y

if __name__ == '__main__':
   testf()
