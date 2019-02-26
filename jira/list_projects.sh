python jira_projects.py | sed -e 's/>/\'$'\n/g' | grep JIRA | awk -F= '{print $2 $3 $4}' | sed -e "s/'//g" | sed -e 's/u//g' | sed 's/name//g' | sed 's/id//g' | sed 's/, /:/g'
