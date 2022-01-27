var fs = require('fs');

fs.open('fsopen5.html', 'w', function(err, file){
    if(err) throw err;
    console.log("Saved!");
});