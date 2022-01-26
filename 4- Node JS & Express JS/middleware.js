var express = require('express');
var app = express();


//THIRD PARTY MIDDLEWARE
//BODY PARSER
var bodyParser = require('body-parser');
//To parse URL encoded data
app.use(bodyParser.urlencoded({ extended: false }))
//To parse json data
app.use(bodyParser.json())

//COOKIE PARSER
var cookieParser = require('cookie-parser');
app.use(cookieParser())



//First middleware before response is sent
app.use(function(req, res, next){
    console.log("Start");
    next();
});

//Route handler
app.get('/', function(req, res, next){
    res.send('Middle');
    next();
});

app.use('/', function(req, res){
    console.log('End');
});

app.listen(8081);



