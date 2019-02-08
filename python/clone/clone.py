#!/usr/bin/env python
from __future__ import print_function
import os
import argparse

if __name__ == "__main__":
   
   # {{{ Process arguments
   ap = argparse.ArgumentParser()
   ap.add_argument("jira", help="Jira Ticket")
   ap.add_argument("cr", help="Change Request Number")
   ap.add_argument("-v", "--verbose", help="be verbose", action="store_true")
   args=ap.parse_args()
   # }}}
   
   # {{{  Verbose
   if args.verbose:
      print("jira is %s" % args.jira)
      print("Change Request is %s" % args.cr)
   # }}}
