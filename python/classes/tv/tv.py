"""
Author:		Ahbaid Gaffoor
File:		tv.py
Date:		Monday 8/22/2011
Use:		Example class implementation
		see try.py for an example
"""

class tv:
    def __init__(self,model,size):
       self.model = model
       self.size = size
       self.volume = 0
       self.resolution = '1080p'

    def __add__(self,increment):                       
       """
       Return a new instance with size=size+increment
       """
       return tv(self.model,self.size+increment)

    def __sub__(self,decrement):                       
       """
       Return a new instance with size=size-decrement
       """
       return tv(self.model,self.size-decrement)

    def volup(self,volup=1):                           
        """
        Increase volume by volup (default +1)
        """
        if (self.volume + volup) < 100: self.volume+=volup
        else: self.volume = 100

    def voldn(self,voldn=1):                           
        """
        Decrease volume by voldn (default -1)
        """
        if (self.volume - voldn) > 0: self.volume-=voldn
        else: self.volume = 0

    def _print(self):                                  
        """
        Display attributes and values of an instance
        """
        return ''.join( ['%s:%s;' % (key,self.__dict__[key]) for key in self.__dict__.keys()] )

    def Print(self):                                   
        """
        Print tv attribute information via. t.Print() 
           >>> from tv import *
           >>> t=tv('sony',27)
           >>> t.Print()
           volume:0;model:sony;resolution:1080p;size:27;
        """
        print self._print()

    def __str__(self):
        """
        Print tv attribute information via. __str__ built-in
        See Print for example
        """
        return self._print()
