# go to the directory with the local database
# this backup was taken with the mongodump-to-oplog-timestamp.sh script and oplog-ts-query.js doc file
cd oplog-bkups/local
# rename oplog.rs.bson to oplog.bson
mv oplog.rs.bson oplog.bson
# remove all other files
mkdir -p ~/o
mv oplog.rs.metadata.json ~/o
# connect to the primary from the location with the oplog.bson file and run the command
mongorestore --port=27000 --oplogReplay .
