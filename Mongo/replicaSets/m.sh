if [ $# -ne 1 ]; then
   p=`ps -ef|grep mongod|grep -v grep|awk -F\-- '{print $6}' | head -1 | awk '{print $2}'`
   mongo --port $p --quiet
else
   mongo --port 27001 --quiet
fi
