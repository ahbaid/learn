#!/usr/bin/env python

abc='abcdefghijklmnopqrstuvwxyz'
print("abc: ",abc)

print("Length of abc is: ", len(abc))

print("abc[:] -> ",abc[:])

print("abc[0:6] print characters from pos 0 to pos 5(6-1) -> ",abc[0:6])

print("abc[1:6] print characters from pos 1 to pos 5(6-1) -> ",abc[1:6])

print("abc[abc.__len__()-1] prints the last character -> ",abc[abc.__len__()-1])
