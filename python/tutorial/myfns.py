# {{{ sq(n)
def sq(n):
   return n*n
# }}}

# {{{ fac(n)
def fac(n):
    if (n==0):
       return 1
    else:
		 return n*fac(n-1)
# }}}

# {{{ fib(n)
def fib(n):
  if (n==1):
     return 1
  elif (n==2):
     return 1
  else:
     return fib(n-2)+fib(n-1)
# }}}

# {{{ fibseq(n)
def fibseq(n):
  for i in range(1,n+1):
     print "fib(",i,"): ", fib(i)
# }}}

# {{{ d2b(n)
def d2b(n):
   b=''
   while n:
      b=str(n % 2)+b
      n = n/2
   return b
# }}}

# {{{ rev(s)
def rev(s):
   l=list(s)
   l.reverse()
   return ''.join(l)
# }}}

      
# {{{ main()
def main():
   print
   n = raw_input("Enter a number: ")
   s = raw_input("Enter a string: ")
   print 'Square of ', n, 'is: ', sq(float(n))
   print 'Factorial of ', n, 'is: ', fac(int(n))
   print 'Fibonacci(', n, ') is: ', fac(int(n))
   print 'Reversal of:',s ,'is: ', rev(str(s))
   print
# }}}

if __name__ == '__main__':
   main()
