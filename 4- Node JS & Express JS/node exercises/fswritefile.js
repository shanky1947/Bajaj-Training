var fs = require('fs');
var http = require('http');

fs.writeFile('fsWrite.html', 'overwritten data', function(err){
    if(err) throw err;
    console.log('Saved!');
});

http.createServer(function(req, res){
    fs.readFile('fswrite.html', function(err, data){
        res.writeHead(200, {'COntent-Type':'text/html'});
        res.write(data);;
        return res.end();
    });
}).listen(8081);