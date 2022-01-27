var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mongoose = require('mongoose');

app.set('view engine', 'pug');
app.set('views', './views');
app.use(bodyParser.urlencoded({extended: true}));

mongoose.connect('mongodb://localhost/my_db');

var personSchema = mongoose.Schema({
    name: String,
    age: Number,
    nationality: String
});

var Person = mongoose.model("Person", personSchema);

var things = require('./mongoosedb_things');
app.use('/things', things);

app.get('/main', function(req, res){
    res.render('main');
});

app.post('/main', function(req, res){
    var value = req.body.label;
    if(value=='c')
        res.redirect('/things/create');
    else if(value=='v')
        res.redirect('/things/view');
    else if(value=='u')
        res.redirect('/things/update');
    else if(value=='d')
        res.redirect('/things/delete');
    res.redirect('/main');
});


app.listen(8081);