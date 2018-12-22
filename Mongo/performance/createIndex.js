use foo
//db.testcol.createIndex( { a : 1, b : 1 } );

db.testcol.dropIndexes()
db.testcol.createIndex( { b : 1, a : 1 } )
