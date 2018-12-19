use sample
// {{{ Purge & Insert Data
db.movies.drop()
print("// ---- Insert rows ----");
db.movies.insertMany ( [
   { "title" : "Batman", "category" : [ "action", "adventure" ], "imdb_rating" : 7.6, "budget" : 35},
   { "title" : "Godzilla", "category" : [ "action", "adventure", "sci-fi" ], "imdb_rating" : 6.6 },
   { "title" : "Home Alone", "category" : [ "family", "comedy" ], "imdb_rating" : 7.4} 
] );
// }}}

// {{{ $
db.movies.find( {}, {"_id":0, "title":1, "category":1} );
db.movies.updateMany(
   { "category":"action" },
   { $set: { "category.$" : "action-adventure" } }
);
db.movies.find( {}, {"_id":0, "title":1, "category":1} );
// }}}
