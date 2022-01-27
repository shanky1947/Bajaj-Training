var express = require('express');
var app = express();

var cookieParser = require('cookie-parser');
app.use(cookieParser());

app.get('/', function(req, res){
    res.cookie('name', 'express').send('cookie set'); //Sets name = express
 });
app.get('/cookie1', function(req, res){
    //Expires after 360000 ms from the time it is set.
    res.cookie('name', 'express', {expire: 36000 + Date.now()});
 });
 app.get('/cookie2', function(req, res){
    //This cookie also expires after 360000 ms from the time it is set.
    res.cookie('name', 'express', {maxAge: 360000});
 });
app.get('/cookie', function(req, res){
    console.log('Cookies: ', req.cookies);
});

app.get('/clear_cookie_express', function(req, res){
    res.clearCookie('express');
    res.send('cookie express cleared');
 });

 app.listen(8081);