use sample

// list indexes
print ("# {{{ Indexes");
db.tweets.getIndexes();
db.tweets.getIndexKeys();
print ("# }}}");

// drop indexes
print ("# {{{ Drop Indexes");
db.tweets.dropIndexes()
print ("# }}}");

// find with explain (no index)
print ("# {{{ find with explain");
db.tweets.find( {"user.followers_count":1000}).explain()
print ("# }}}");

// create index
print ("# {{{ Create an Index");
db.tweets.createIndex( { "user.followers_count" : 1 } , { background : true });
print ("# }}}");

// list index with keys
print ("# {{{ List indexes with keys");
db.tweets.getIndexKeys()
print ("# }}}");

// find with index
print ("# {{{ find with index explain");
db.tweets.find( {"user.followers_count":1000}).explain("executionStats");
print ("# }}}");
