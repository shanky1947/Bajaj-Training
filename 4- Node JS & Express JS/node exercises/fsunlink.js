var fs = require('fs');

fs.unlink('test1.js', function(err){
    if(err) throw err;
    console.log('unlink file successfully');
});