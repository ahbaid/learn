for p in `seq 27000 27002`; do
   mongod --replSet demo \
          --logpath ./logs/$p.log --logappend \
          --dbpath ./data/db-$p \
          --port $p \
          --smallfiles --oplogSize 64 \
          --fork
done
