var express = require('express');
var app = express();

app.set('view engine', 'pug');
app.set('views','./views');

app.get('/dynamic_view', function(req,res){
    res.render('dynamic', {
        name: "TutorialsPoint",
        url: "https://www.tutorialspoint.com"
    });
    // res.send("Hello");
});

app.listen(8081);