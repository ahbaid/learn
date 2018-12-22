/* replicaset-config.js */
cfg = { _id: "demo", members:[
{ _id : 0, host : "localhost:27000"},
{ _id : 1, host : "localhost:27001"},
{ _id : 2, host : "localhost:27002"}
] };
rs.initiate(cfg)
//db.disableFreeMonitoring()
