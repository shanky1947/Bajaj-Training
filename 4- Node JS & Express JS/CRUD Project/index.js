var express = require('express');
var app = express();
var bodyParser = require('body-parser');


app.set('view engine', 'pug');
app.set('views', './views');
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());


var things = require('./things');
app.use('/things', things);

//Main routes
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
});

app.listen(8081);
module.exports = app;