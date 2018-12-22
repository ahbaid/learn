use grades

// {{{ arrayFilters
db.grades.findOne()
db.grades.updateOne(
   {"scores.type":"homework"},
   {$inc: { "scores.$[filter1].score":10 }},
   {arrayFilters: [ {"filter1.score" : {$gte:40, $lt:60} } ] }
);
db.grades.findOne()
// }}}
