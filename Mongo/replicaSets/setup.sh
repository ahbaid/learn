mkdir -p logs
for p in `seq 27000 27006`; do
   mkdir -p data/db-$p 
   mongod --replSet demo \
          --logpath ./logs/$p.log --logappend \
          --dbpath ./data/db-$p \
          --port $p \
          --smallfiles --oplogSize 64 \
          --fork
done

mongo --port 27000 < replicaset-config.js
