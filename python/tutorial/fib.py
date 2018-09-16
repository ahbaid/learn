def fib(n):
  if (n==1):
     return 1
  elif (n==2):
     return 1
  else:
     return fib(n-2)+fib(n-1)

def fibseq(n):
  for i in range(1,n+1):
     print "fib(",i,"): ", fib(i)

if __name__ == '__main__':
  fibseq(5)
