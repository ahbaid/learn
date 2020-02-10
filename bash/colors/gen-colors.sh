#!/bin/bash

i=16
while [ $i -lt 256 ]; do
   echo -e "$i: \\033[48;5;${i}mCOLOR\\033[0m"
   ((i++));
done
