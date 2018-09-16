def fbp(n):
   if n <= 1:
       return n
   else:
       return(fbp(n-1) + fbp(n-2))
