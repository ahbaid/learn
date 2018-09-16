"""
Author:		Ahbaid Gaffoor
File:		inheritance.py
Date:		Sat 08/20/2011
Use:		Example class showing inheritance
"""

class c2:
   def __init__(self):
      self.x=24
      self.z=26

class c3:
   def __init__(self):
      self.w=23
      self.z=26

class c1(c2,c3):
   def __init__(self,name):
      self.y=25
      self.name=name

   def setname(self,name):
      self.name=name

   def display(self):
      print self.name
