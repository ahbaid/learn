use sample
db.movies.insertMany(
 [
   {
      "title":"Avatar",
      "box_office" : { "gross":760, "budget":237, "opening_weekend":77 }
   },
   {
      "title":"E.T.",
      "box_office" : { "gross":349, "budget":10.5, "opening_weekend":14 }
   }
 ]
);

// No values
db.movies.find( { "box_office" : { "gross":760 } } );

// dot notation to match a sub document
db.movies.find( { "box_office.gross" : 760 } );

// dot notation to match a sub document
db.movies.find( { "box_office.gross" : 760 } );
