var http = require('http');
var formidable = require('formidable');
var fs = require('fs');

http.createServer(function (req, res) {
  if (req.url == '/uploadfile') {
    // console.log("entered5");
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {

        var oldpath = files.filetoupload.filepath;
        var newpath = 'D:/Projects/Web Dev Projects/Exercises NODE JS/Bajaj/file_uploads/' + files.filetoupload.originalFilename;
      
        // Read the file
      fs.readFile(oldpath, function(err, data){
        if (err) throw err;
            console.log('File read!');

        // Write the file
        fs.writeFile(newpath, data, function (err) {
          if (err) throw err;
          res.write('File uploaded and moved!');
          res.end();
          console.log('File written!');
        })
        // Delete the file
        fs.unlink(oldpath, function (err) {
            if (err) throw err;
            console.log('File deleted!');
        });
      });
    });
  } else {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(`<form action="uploadfile" method="post" enctype="multipart/form-data">
    <input type="file" name="filetoupload"><br>
    <input type="submit">
    </form>`);
    return res.end();
  }
}).listen(8081);