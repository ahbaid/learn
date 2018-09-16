#!/usr/bin/env python
'''

Python 3 provides string module

% operator like printf
%s string
%d numbers
%f float
%e exponent
%% put % character

'''
import string
import math
string.whitespace

# The value of pi
print ("PI=%6.10f" % math.pi)

# Multiple values are passed as a tuple
print ("There are %d letters and %d vowels in the alphabet" % (26,5))

# Dictionary
d={'fruit':'apple', 'color':'red'}
print ("There is one %(color)s %(fruit)s in the basket" % d)

# List
list1=[1,2,3]
print(list1)
print(str(list1))

# Stringto list
s="this is a string"
list2=list(s)
print(list2)
print("length of list2 is %d" % len(list2))

# split - help(str.split)
s="this is a string"
print(s.split())
print(s.split(' '))
print(s.split(None))
print(s.split(' ',1))

# join
list1='a d v e n t u r e'.split()
print('+'.join(list1))
