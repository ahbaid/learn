class MyClass1(object):

   def __init__(self, n):
       self.x=n

   def print_val(self):
       print('the val of x in this obj is:', self.x)



class MyClass2(MyClass1):

   def print_val(self):
       print('the val of x in this obj is:', self.x)


class MyClass3(MyClass1):

   def __init__(self,n):
       super().__init__(n)
       self.y = n * n


   def print_val(self):
       print('the val of x in this obj is:',self.x)
       print('the val of y in this obj is:',self.y)



def main():
    a1=MyClass1(100)
    a2=MyClass1(200)

    a1.print_val()
    a2.print_val()

    b1=MyClass2(300)
    b1.print_val()


if __name__ == '__main__':
    main()
