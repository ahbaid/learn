"""
Author:		Ahbaid Gaffoor
File:		abc.py
Date:		Mon 08/22/2011
Use:		Playing around with ways to generate an alphabet string
"""

# abc list generation
abc=[chr(n) for n in range(97,97+26)]
abc=map(chr, range(97,97+26))
abc=[chr(n) for n in range(97,97+26)]
abc

# abc dictionary generation
abc={chr(n+96):n for n in range(1,1+26)}
abc
