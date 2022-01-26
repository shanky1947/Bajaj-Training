var express = require('express');
var app = express();

app.get('/:id', function(req, res){
    res.send('The id you is specified is: ' + req.params.id);
});

app.listen(8081);