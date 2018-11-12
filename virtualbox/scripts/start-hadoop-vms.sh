# {{{ Header Notes
# Name: start-hadoop-vms.sh
# Date: Apr 1st 2017
# Use: Start machines for hadoop cluster
# }}}
PREFIX=hdp
seq -w 1 10 | while read s; do
  m=$PREFIX$s
  echo "Starting machine $m"
  VBoxManage startvm $m --type headless
done
