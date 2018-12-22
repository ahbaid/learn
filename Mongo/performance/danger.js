db.currentOp().inprog.forEach(   function(op) { if(op.ns  != "local.oplog.rs") {if(op.secs_running >= 1)  printjson(op.opid);   }} )
// db.killOp('375342f7215449a3adee1c63c71ff190:1771160905')
