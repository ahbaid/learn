rs.slaveOk();
use local
// Most recent data first and filter out no-op operations
db.oplog.rs.find({op : {$ne:"n"}}).sort({$natural:-1});
