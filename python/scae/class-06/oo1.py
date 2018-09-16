class A(object):
   '''docstring for class A'''
   pass

class B(A):
   '''docstring for class B'''
   pass

class C(B):
   '''docstring for class C'''
   pass


class D(C):
   '''docstring for class D'''
   pass

print('Class B is a subclass of Class A: ',issubclass(B,A))
print('Class C is a subclass of Class B: ',issubclass(C,B))
print('Class C is a subclass of Class A: ',issubclass(C,A))
print('Class D is a subclass of Class B,C or D: ',issubclass(D,(C,B,A)))
