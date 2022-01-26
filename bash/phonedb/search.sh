#!/bin/bash

function usage() {
   echo
   echo "usage: "
   echo "$0 <dbfile> <search> <search_string>"
   echo
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi;
