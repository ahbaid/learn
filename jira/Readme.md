# JIRA Scripts

# Files:
## ~/.netrc
* Holds your JIRA creds
* recommend "chmod 0600 ~/.netrc" or not using raw creds for prod use

## jira_info.py
~~~~
$ ./jira_info.py 

 Usage:  ./jira_info.py <ticket-number>
~~~~

## list_projects.sh (uses jira_projects.py)
~~~~
$ ./list_projects.sh | head -10
ABCD:ABCD company:19784
XYZ2:XYZ project2:29003
~~~~

# Links:
* https://jira.readthedocs.io/en/master/
