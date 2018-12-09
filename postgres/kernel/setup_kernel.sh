#!/bin/bash
# {{{ Header
#######################################################################################################
#
# /opt/em/pds/kernel/setup-kernel.sh
# Author: Ahbaid Gaffoor
# Date: Sun Mar 4th 2018
# Use: Run this to set kernel paramters from an input text script
#
# Requirements:
# 1) An input file with lines of the form "kernel_parameter=value"
#
# WARNING: This does not validate values, please review settings before running this script
#
#######################################################################################################
# }}}

# {{{ usage function
function usage() {
   echo
   echo "$0 <filename>"
   echo "- filename: a file with the required parameters and their settings"
   echo
}
# }}}

# {{{ Check for an argument, if none error, else assign.
if [ $# -ne 1 ]; then
   usage
   exit 1
else
   KFILE=$1
fi
# }}}

# {{{ validate that the file exists
if [ ! -f $KFILE ]; then
   echo
   echo "ERROR: $KFILE does not exist or is not readable..."
   echo
   exit 1
fi
# }}}

# {{{ Backup kernel configuration
BACKUP_SYSCTL=/tmp/sysctl.conf.`date +'%Y%m%d-%H%M%S'`
sysctl -a >> $BACKUP_SYSCTL

echo
echo "backed up sysctl configuration to $BACKUP_SYSCTL"
echo
# }}}

# {{{ Scan the file, dump older values and set new ones then validate
cat $KFILE | grep -v ^# | while read LN; do

   PARAMETER=`echo $LN | awk -F= '{print $1}'`
   SETTING=`echo $LN | awk -F= '{print $2}'`

   echo
   echo "processing: $PARAMETER => $SETTING"
   echo "> currently: `sysctl $PARAMETER`"

   CMD="sysctl -w $PARAMETER=$SETTING"
   echo "> running: $CMD"
   $CMD

   echo "> now: `sysctl $PARAMETER`"

done
echo
# }}}
