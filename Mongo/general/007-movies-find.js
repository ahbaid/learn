use sample
db.movies.drop()
db.movies.insertMany(
 [
    { "title":"Jaws", "year":1975, "imdb_rating": 8.1 },
    { "title":"Batman", "year":1977, "imdb_rating": 9.1 },
 ]
)
