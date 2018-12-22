use sample
db.movies.drop()
db.movies.insertMany( [
   { 
     "title":"E.T",
     "filming_locations" :
        [
          { "city":"Culver City", "state":"CA", "country":"USA" },
          { "city":"Los Angeles", "state":"CA", "country":"USA" },
          { "city":"Crescent City", "state":"CA", "country":"USA" }
        ]
   },
   { 
     "title":"Star Wars",
     "filming_locations" :
        [
          { "city":"Ajim", "state":"Jerba", "country":"Tunisia" },
          { "city":"Yuma", "state":"AZ", "country":"USA" }
        ]
   }
] );

// Two documents
db.movies.find( { "filming_locations.country" : "USA" } );
