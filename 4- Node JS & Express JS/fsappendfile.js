var fs = require('fs');

fs.appendFile('products.html', '<div>Product List</div>', function (err) {
  if (err) throw err;
  console.log('Saved!');
});

var http = require('http');
http.createServer(function (req, res) {
  fs.readFile('products.html', function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
}).listen(8081);