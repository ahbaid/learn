rs.slaveOk()
use local
//db.oplog.rs.find()
db.oplog.rs.find({op: {$ne:"n"}})
