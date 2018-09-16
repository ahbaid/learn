#!/usr/bin/env python

def func2(arg1, arg2='def_val', *extra_args, **extra_kwargs):
   print('='*8)
   print('arg1=',arg1)
   print('arg2=',arg2)

   for arg in extra_args:
      print('extra_arg=',arg)

   for k,v in extra_kwargs.items():
      print('extra kwargs=%s:%s' % (k,v) )


func2(100)
func2(200, foo='bar')
func2(300,'x', 'y', 'z', a='apple', b='boy')
