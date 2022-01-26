var express = require('express');
var app = express();

app.set('view engine', 'pug');
app.set('views','./views');

app.use(express.static('public'));

//MULTIPLE STATIC DIRECTORIES
// app.use(express.static('public'));
// app.use(express.static('images'));

//VIRTUAL PATH PREFIX
// app.use('/static', express.static('public'));


app.get('/static_file', function(req,res){
    res.render('static_file');
});

app.listen(8081);