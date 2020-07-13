# {{{ def print_list(L,comment=''):
def print_list(L,comment=''):
   print(comment, end='')
   for x in L:
      if (x <= (L.__len__()-1)):
         print(x, end=',')
      else:
         print(x)
# }}}

# {{{ def get_msq_target(n=4):
def get_msq_target(n=4):
   return n*(n**2+1)/2
# }}}

# {{{ def check_sum(L,dimension=4)
def check_sum(L,dimension=4):
   return (sum(L)==get_msq_target(dimension))
# }}}

# {{{ def init_list(dimension=4):
def init_list(dimension=4):
   L=[]
   for x in range(1,dimension+1):
      L.append(x)
   return L
# }}}

# {{{ def main(dimension=4):
def main(dimension=4):
   print("\nMagic Squares\n=============")
   N=init_list(dimension**2)
   W=init_list(dimension**2)
   print_list(N,"Numbers: ")
   print_list(W,"Working: ")
   print("\n")
# }}}
   
if __name__ == "__main__":
   main()
