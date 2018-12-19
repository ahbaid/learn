use sample
db.movies.drop()
db.movies.insertMany(
[
 {"title":"Batman", "category": ["action", "adventure"], "imdb_rating":7.6, "budget":35, "roten_tomatoes":7.1 },
 {"title":"Godzilla", "category": ["action", "adventure", "sci-fi"], "imdb_rating":6.6, "roten_tomatoes":8.0 },
 {"title":"Home Alone", "category": ["family", "comedy"], "imdb_rating":7.4, "roten_tomatoes":6.3 }
]
);

// everything
db.movies.find()

// ratings gte 7
db.movies.find( {"imdb_rating":{$gte:7} } );

// category ne family - travereses the array of values in category
db.movies.find( {"category":{$ne:"family"} });

// title not Batman or Godzilla
db.movies.find( {"title":{$nin:["Batman","Godzilla"]} });

// find imdb_rating between 5 and 7
// db.movies.find( { $and : [ { "imdb_rating":{$gte:5} }, { "imdb_rating":{$lte:7} } ] });
db.movies.find(
  { 
    $and : [ 
       { "imdb_rating":{$gte:5} },
       { "imdb_rating":{$lte:7} }
    ]
  }
);

// find imdb_rating between 5 and 7 - relying on "," operator being an and - 
// db.movies.find( { "imdb_rating":{$gte:5} ,  "imdb_rating":{$lte:7} } );
db.movies.find(
  { 
     { "imdb_rating":{$gte:5} },
     { "imdb_rating":{$lte:7} }
  }
);

// last way, rely neat, but relies on "," as $and
db.movies.find( { "imdb_rating":{$gte:5, $lte:7} } );

// find by the field existence
db.movies.find( { "budget" : { $exists:true } } );

// type 1 or alias double
db.movies.find( { "budget" : {$type:1} });
db.movies.find( { "budget" : {$type:"double"} });

// example $expr operator
db.movies.find( { $expr: { $gt: [ "$:roten_tomatoes", "$imdb_rating" ] } } );

// Array operators - order does not matter in the array with $all
db.movies.find( { "category" : { $all : [ "sci-fi", "action" ] } } );
db.movies.find( { "category" : { $all : [ "action", "sci-fi" ] } } );
db.movies.find( { "category" : { $size : 1 } } );


// add a movie
db.movies.insertOne(
 {
   "title":"Raiders of the Lost Ark", 
   "filming_locations":[
      { "city":"Los Angeles", "state":"CA", "country":"USA" },
      { "city":"Rome", "state":"Lazio", "country":"Italy" },
      { "city":"Florence", "state":"SC", "country":"USA" }
   ]
 }
);

// incorrect query - applies to the entire document, not matching at the sub document level.
db.movies.find( { "filming_locations.city": "Florence", "filming_locations.country": "Italy" });

// correct using the $elemMatch operator
db.movies.find( { "filming_locations" : { $elemMatch : { "city" : "Florence", "country":"Italy" } } } );
