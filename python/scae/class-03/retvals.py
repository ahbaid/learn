#!/usr/bin/env python


def test0(): 
    a=1

def mvals():
    """ return a tuple """
    a=1
    b=2
    return(a,b,-3)


(x,y,z) = mvals()
print("x=%s y=%s z=%s" % (x, y , z))
print("x=", x)

d=mvals()
print(type(d))
print(d)
