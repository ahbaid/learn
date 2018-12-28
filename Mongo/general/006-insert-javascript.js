use sample
for (i=1; i<=10000; i++) {
   db.stuff.insert( {"a": i} );
}
db.stuff.count()
