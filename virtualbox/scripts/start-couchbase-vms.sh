# {{{ Header Notes
# Name: start-couchbase-vms.sh
# Date: Apr 1st 2017
# Use: Start machines for couchbase cluster
# }}}
PREFIX=cb
seq -w 1 10 | while read s; do
  m=$PREFIX$s
  echo "Starting machine $m"
  VBoxManage startvm $m --type headless
done
