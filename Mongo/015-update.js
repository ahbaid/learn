use sample
db.movies.drop()
print("// ---- Insert rows ----");
db.movies.insertMany ( [
   { "title" : "Batman", "category" : [ "action", "adventure" ], "imdb_rating" : 7.6, "budget" : 35},
   { "title" : "Godzilla", "category" : [ "action", "adventure", "sci-fi" ], "imdb_rating" : 6.6 },
   { "title" : "Home Alone", "category" : [ "family", "comedy" ], "imdb_rating" : 7.4} 
] );


// $inc : increment
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "imdb_rating":1} );
db.movies.updateOne( {title:"Batman"}, { $inc: { "imdb_rating" : 2 } } );
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "imdb_rating":1} );

// $mul : multiply
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "imdb_rating":1, "budget":1} );
db.movies.updateOne( {title:"Batman"}, {$inc:{"imdb_rating":2}, $mul:{"budget":4}} );
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "imdb_rating":1, "budget":1} );

// track sequels per movie
db.movies.find( {}, {"_id":0, "title":1, "sequels":1} );
db.movies.updateOne( {}, {$set: {"sequels":0}} );
db.movies.updateMany( {}, {$set: {"sequels":0}} );
