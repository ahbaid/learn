/* demo.js */
cfg = { _id: "demo", members:[
{ _id : 0, host : "localhost:27000", priority:5 },
{ _id : 1, host : "localhost:27001", priority:5 },
{ _id : 2, host : "localhost:27002"},
{ _id : 3, host : "localhost:27003"},
{ _id : 4, host : "localhost:27004", priority:0, arbiterOnly:true},
{ _id : 5, host : "localhost:27005", priority:0, hidden:true},
{ _id : 6, host : "localhost:27006", priority:0, slaveDelay:120, hidden:true}
] };
rs.initiate(cfg)
