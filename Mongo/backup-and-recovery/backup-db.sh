if [ $# -ne 1 ]; then
   echo
   echo "Must specify a port"
   echo
   exit 1
else
   ./s.sh < fsyncLock.js
   rm -rf backup-$1
   mkdir -p backup-$1
   cp -R data/db-$1 backup-$1
   ls -al backup-$1
fi
