#!/usr/bin/python
from __future__ import print_function
from jira import JIRA, JIRAError
import sys

if __name__ == "__main__":

   def InitJira():
      options = {
         'server' : 'https://me.jira.com'
      }
      return JIRA(options)

   def Usage():
      print ("\n","Usage: ", sys.argv[0], "<ticket-number>\n")

   if (len(sys.argv) == 1):
      Usage()
   else:
      in_issue = sys.argv[1].upper()
      emj=InitJira()
      try:
         ji = emj.issue(in_issue)
         print("\n",in_issue+": [",ji.fields.issuetype, "/", ji.fields.status, ji.fields.priority, "]", ji.fields.summary, "\n")
      except JIRAError as je:
         print("\n")
         print(je.status_code,": ", je.text)
         print("Invalid JIRA ticket: ", in_issue,"\n")
