var express = require('express');

var app = express();

// Routing in index.js file
// app.get(route, callback)
// callback function has 2 parameters, request and response
// app.get('/', function(req, res){
//     res.send("hello world");
// });

// Using things.js to separately define routing
var things = require('./things');

app.use('/things', things);


//app.listen(port, [host], [backlog], [callback]])
app.listen(8081);