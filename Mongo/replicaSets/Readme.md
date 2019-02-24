Mongo Replica Set Helper Scripts

# Overview:
* Use these to build a quick replicaset on your localhost machine.
* Assumes "mongo" and "mongod" are in your path.
* Creates data and log directories in the local folder.
* Assumes the first mongod node port is the master (may fix this later).

# Scripts
* setup.sh <nodes> <starting-port>
** Creates a replica set with the number of nodes passed, starting with the starting-port and increment for as many nodes are needed
* teardown.sh
** No intelligence, destroy data and log dirs, kill mongod processes indiscriminately
* master.sh
** Connect to the first port node, assume it's master.
** optional first argument if you have a specific port.
