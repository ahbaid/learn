use sample
db.movies.drop();

for (i=1; i<=20; i++) {
   db.movies.insertOne( { "_id":i, "title":i, "imdb_rating":i, "box_office":i } );
}

db.movies.find()

// no "box_office", just title and imdb_rating
db.movies.find( {"_id":3}, {"title":1, "imdb_rating":1} );

// no "imdb_rating"
db.movies.find( {"_id": { $gte:10}}, { "imdb_rating":0} );

// just "title"
db.movies.find( {"_id":4}, {"title":1, "imdb_rating":1} );

// just "imdb_rating", "box_office"
db.movies.find( {"_id":5}, { "_id":0, "title":0} );

// Can't mix inclusion/exclusion except _id
db.movies.find( { "_id":6 }, { "title":1, "imdb_rating":0 } );
