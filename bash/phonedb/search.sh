#!/bin/bash

function usage() {
   echo
   echo "usage: "
   echo "$0 <dbfile> <raw>"
   echo "$0 <dbfile> <data>"
   echo "$0 <dbfile> <search> <search_string>"
   echo
}

# Validate usage, assign file to a variable if found
if [ $# -lt 1 ]; then
  usage
  exit 1
else
  if [ -f $1 ]; then
     DATAFILE=$1
     echo "Processing $DATAFILE"
  else
     echo "Data file $1 not found."
     exit 0
  fi
fi;


if [ $# -ge 2 ]; then
  if [ $2 == "raw" ]; then
     echo
     echo "Dump raw file $DATAFILE"
     cat $DATAFILE
     echo
  elif [ $2 == "dump" ]; then
     echo
     echo "Dump raw file $DATAFILE"
     cat $DATAFILE | grep -v ^#
     echo
  fi
fi
