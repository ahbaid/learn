ps -ef|grep mongod | grep "replSet demo" | awk '{print $2}' | xargs kill -9
rm -rf data logs
