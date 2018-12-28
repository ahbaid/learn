use sample
db.movies.insertMany(
  [
     { "_id" : "Jaws", "year" : 1975 },
     { "_id" : "Titanic", "year" : 1997 },
     { "_id" : "The Lion Key", "year" : 1994 }
  ],
  { ordered : false }
);
