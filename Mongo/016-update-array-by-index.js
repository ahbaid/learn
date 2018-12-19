use sample
db.movie_mentions.drop()
db.movie_mentions.insertOne(
   {
      "title":"E.T",
      "day" : ISODate("2015-03-27T00:00:00.000Z"),
      "mph" : [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] 
   }
);

db.movie_mentions.find( {}, {"_id":0,"mph":{$slice:[5,1]}})
db.movie_mentions.updateOne( { }, {$set:{"mph.5":3000}});
db.movie_mentions.find( {}, {"_id":0,"mph":{$slice:[5,1]}})
