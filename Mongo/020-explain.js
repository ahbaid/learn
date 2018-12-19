use sample
// find
print ("# {{{ find");
db.tweets.find( {"user.followers_count":1000}, { "_id":0, "user.name":1 } );
print ("# }}}");

// find with explain
print ("# {{{ find with explain");
db.tweets.find( {"user.followers_count":1000}, { "_id":0, "user.name":1 } ).explain();
print ("# }}}");

// find with explain and executionStats
print ("# {{{ find with explain and executionStats");
db.tweets.find( {"user.followers_count":1000}, { "_id":0, "user.name":1 } ).explain("executionStats");
print ("# }}}");

// ExplainableCollection
print ("# {{{ ExplainableCollection");
var x = db.tweets.explain()
x.find( { "user.followers_count" : 1000 } )
print ("# }}}");


