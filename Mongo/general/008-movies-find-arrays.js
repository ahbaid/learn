use sample
db.movies.drop()
db.movies.insertMany(
[
 {"title":"Batman", "category": ["action", "adventure"] },
 {"title":"Godzilla", "category": ["action", "adventure", "sci-fi"] },
 {"title":"Home Alone", "category": ["family", "comedy"] }
]
);

// Match documents in one category
db.movies.find( {"category":"action"} );

// Match for several categories (no match for these two)
db.movies.find( {"category": [ "action", "sci-fi" ] } );

// only the second document
db.movies.find( {"category": [ "action", "adventure", "sci-fi" ] } );

// When querying arrays the entire array must match as the literal
