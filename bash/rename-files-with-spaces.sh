# This script renames files in the current directory changing " " in the name to "+"

ls -1 | while read f; do echo "$f" `echo $f | sed 's/ /+/g'`; done`
# Uncomment the next line to change the names
#ls -1 | while read f; do mv "$f" `echo $f | sed 's/ /+/g'`; done`
