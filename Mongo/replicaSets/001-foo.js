use foo
db.bar.drop();
db.bar.insertOne({a:1});
db.bar.insertOne({a:2});
db.bar.updateMany( {}, {$set:{"text":"some text"}} );
db.bar.updateMany( {a:2}, {$inc:{b:10}});
db.bar.updateMany( {a:2}, {$inc:{b:10}});
db.bar.createIndex({a:1});
