# {{{ Header Notes
# Name: scr.sh
# Date: Sep 5th 2015
# Use: Helper script for screen session management
#
# Notes:
# ======
# The script starts a new screen session if it does not exist.
# It looks for a default.screen config file and uses it if no available session.screen file exists.
# If the session exists it resumes teh existing session.
# If multiple sessions exist then a listing is produced and the script exits.
# }}}

# {{{ function usage()
function usage() {
   echo
   echo "Usage:"
   echo "======"
   echo "$0 <screen-session>"
   echo "- screen-session: a running screen session to connect to or create"
   echo
}
# }}}

if [ $# -ne 1 ]; then
   usage
   exit 1
else
   # If "-ls" or "ls" is passed as an argument then the screen listing is produced.
   if [[ $1 =~ ^-*ls$ ]]; then
      screen -ls
      exit 0
   fi
   export SCRSESSION="$1"
fi

# {{{ variables
SCRDIR=~/admin/screen
SCRCFGEXT="screen"
SCRFILE=$SCRDIR/$SCRSESSION.$SCRCFGEXT
DEFSCRFILE=$SCRDIR/default.$SCRCFGEXT
SCRSESSIONS=`screen -ls | awk '{print $1}' | grep $SCRSESSION | wc -l`
SCRSLEEP=1
# }}}

if [ $SCRSESSIONS -le 0 ]; then
   echo
   echo "Could not find screen session [" $SCRSESSION "]...."
   if [ -f $SCRFILE ]; then
      echo "Found $SCRFILE, starting session in $SCRSLEEP second(s)...."
      sleep $SCRSLEEP
      screen -S $SCRSESSION -c $SCRFILE
   else
      echo "Could not find $SCRFILE, starting with default screen file $DEFSCRFILE  in $SCRSLEEP second(s)...."
      sleep $SCRSLEEP
      screen -S $SCRSESSION -c $DEFSCRFILE
   fi
   echo
else
   if [ $SCRSESSIONS -eq 1 ]; then
      echo
      echo "Found $SCRSESSION, attaching  in $SCRSLEEP second(s)...."
      sleep $SCRSLEEP
      screen -dR $SCRSESSION
   else
      echo 
      echo "Found multiple screen sessions matching $SCRSESSION, use a more selective session name please...."
      echo
      screen -ls | awk '{print $1}' | grep $SCRSESSION
      echo
   fi
fi
