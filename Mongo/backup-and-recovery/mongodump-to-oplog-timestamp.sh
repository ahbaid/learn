mkdir -p oplog-bkups
mongodump --port 27000 -d local -c oplog.rs --queryFile oplog-ts-query.js --out oplog-bkups
