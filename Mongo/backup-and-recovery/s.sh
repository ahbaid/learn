if [ $# -eq 0 ]; then
  mongo --quiet --port 27002 
else
  mongo --quiet --port $1
fi
