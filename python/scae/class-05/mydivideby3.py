# {{{ divideBy3r(n)

def divideBy3r(n):
    ''' 
    Return (q,r) tuple for q*3+r=n using built-in operators
    '''
    r = n % 3
    q = int(n / 3)
    return (q,r)

# }}}

# {{{ divideBy3(n)

def divideBy3(n):
    ''' 
    Return (q,r) tuple for q*3+r=n using simulated math
    '''

    if n==0:
       return (0,0)
    elif n < -1000 or n > 1000:
       return None
    else:

       if n<0: 
          sign=-1
          z=abs(n)
       else:
          sign=1
          z=n


       if z<3:
          q=0
          r=z
       else:

          i=3
          q=0

          while i<=z:
             i=i+3
             q=q+1

          r=sign*n-3*q

       return (sign*q,sign*r)

# }}}
