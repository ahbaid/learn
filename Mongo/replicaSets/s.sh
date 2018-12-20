if [ $# -eq 0 ]; then
  mongo --port 27002 
else
  mongo --port $1
fi
