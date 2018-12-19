use sample
db.movies.drop()
db.movies.insertMany ( [
   { "title" : "Batman", "category" : [ "action", "adventure" ], "imdb_rating" : 7.6, "budget" : 35},
   { "title" : "Godzilla", "category" : [ "action", "adventure", "sci-fi" ], "imdb_rating" : 6.6 },
   { "title" : "Home Alone", "category" : [ "family", "comedy" ], "imdb_rating" : 7.4} 
] );
