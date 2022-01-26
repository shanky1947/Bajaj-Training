var express = require('express');

var app = new express();

// app.get(route, callback)
// callback function has 2 parameters, request and response
app.get('/', function(req, res){
    res.send("hello world");
});

//app.listen(port, [host], [backlog], [callback]])
app.listen(8081);