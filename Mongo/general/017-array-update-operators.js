use sample
// {{{ Populate movies
db.movies.drop()
print("// ---- Insert rows ----");
db.movies.insertMany ( [
   { "title" : "Batman", "category" : [ "action", "adventure" ], "imdb_rating" : 7.6, "budget" : 35},
   { "title" : "Godzilla", "category" : [ "action", "adventure", "sci-fi" ], "imdb_rating" : 6.6 },
   { "title" : "Home Alone", "category" : [ "family", "comedy" ], "imdb_rating" : 7.4} 
] );
// }}}

// {{{ $push: append
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "category":1} );
db.movies.updateOne( {title:"Batman"}, { $push: {"category":"superhero"} } );
db.movies.updateOne( {title:"Batman"}, { $push: {"category":"dc"} } );
db.movies.updateOne( {title:"Batman"}, { $push: {"category":"knight"} } );
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "category":1} );
// }}}

// {{{ $pop
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "category":1} );
db.movies.updateOne( {title:"Batman"}, { $pop: {"category":1} } );
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "category":1} );
// }}}

// {{{ $pull
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "category":1} );
db.movies.updateOne( {title:"Batman"}, { $pull: {"category":"action"} } );
db.movies.findOne( {title:"Batman"}, {"_id":0, "title":1, "category":1} );
// }}}

// {{{ $pullAll - $addToSet
db.movies.updateOne({"title" : "Batman"},  {$pullAll : {"category" : ["villan", "comic-based"]}})
db.movies.updateOne({"title" : "Batman"},  {$addToSet : {"category" : "action"}})
db.movies.updateOne({"title" : "Batman"},  {$addToSet : {"category" : "action"}})
// }}}
