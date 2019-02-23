# {{{ usage
function usage {
   echo 
   echo "$0 <nodes> <starting-port>"
   echo "- nodes : number of nodes in the replica set"
   echo "- starting-port : first port in the replica set"
   echo "Example: $0 3 27001"
   echo 
}
# }}}

# {{{ prepare_nodes
function prepare_nodes {
nodes=$1
sp=$2

mkdir -p logs
seq $sp `expr $sp + $nodes - 1` | while read p; do
   echo
   echo -n "Preparing Node: [$p]"
   mkdir -p data/db-$p 
   mongod --replSet demo \
          --logpath ./logs/$p.log --logappend \
          --dbpath ./data/db-$p \
          --port $p \
          --smallfiles --oplogSize 64 \
          --fork
   echo
done
}
# }}}

# {{{ gen_rs_config
function gen_rs_config {
nodes=$1
sp=$2
let i=0

echo "cfg = { _id: "demo-$nodes", members:[" > gen-rs-config.js

seq $sp `expr $sp + $nodes - 1` | while read p; do
   echo "{ _id : $i, host : "localhost:$p"}," >> gen-rs-config.js
   let i++
done
echo "] };" >> gen-rs-config.js
echo "rs.initiate(cfg)" >> gen-rs-config.js

mongo --port $sp < gen-rs-config.js

}
# }}}

if [ $# -ne 2 ]; then
   usage
   exit 0
fi

prepare_nodes $1 $2
gen_rs_config $1 $2

