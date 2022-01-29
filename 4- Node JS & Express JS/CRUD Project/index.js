var express = require('express');
var app = express();
var bodyParser = require('body-parser');


app.set('view engine', 'pug');
app.set('views', './views');
app.use(bodyParser.urlencoded({extended: true}));


var things = require('./things');
app.use('/things', things);

//Main routes
app.get('/main', function(req, res){
    res.render('main');
});

app.post('/main', function(req, res){
    var value = req.body.label;
    if(value=='c')
        res.redirect('/things/create', {message: "Redirect to create page"});
    else if(value=='v')
        res.redirect('/things/view', {message: "Redirect to view page"});
    else if(value=='u')
        res.redirect('/things/update', {message: "Redirect to update page"});
    else if(value=='d')
        res.redirect('/things/delete', {message: "Redirect to delete page"});
});


module.exports = app.listen(8081);