#!/usr/bin/python
from __future__ import print_function
from jira import JIRA
options = { 'server' : 'https://me.jira.com' }
j=JIRA(options)
projects=j.projects()
print(projects)
