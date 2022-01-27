var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mongoose = require('mongoose');

app.set('view engine', 'pug');
app.set('views', './views');

app.use(bodyParser.urlencoded({extended: true}));

mongoose.connect('mongodb://localhost/my_db');

var personSchema = mongoose.Schema({
    name: String,
    age: Number,
    nationality: String
});

var Person = mongoose.model("Person", personSchema);

app.get('/person', function(req, res){
    res.render('person');
});

app.post('/person', function(req, res){
    var personInfo = req.body;

    if(!personInfo.name || !personInfo.age || !personInfo.nationality){
        res.render('show_message', {
            message: "Sorry, you provided wrong info", type: "error"
        });
    }
    else{
        var newPerson = new Person({
            name: personInfo.name,
            age: personInfo.age,
            nationality: personInfo.nationality
        });

        newPerson.save(function(err, Person){
            if(err)
                res.render('show_message', 
                    {message: "Database error", type: "error"});
            else
                res.render("show_message", 
                    {message: "New person added", type: "success", person: personInfo});
        });
    }
});



//RETRIEVING DOCUMENTS
//Model.find(conditions, callback)
//Model.findOne(conditions, callback)
//Model.findById(id, callback)

app.get('/find_person', function(req, res){
    Person.find(function(err, response){
        // console.log(response);
        res.json(response);
    });
});

app.get('/find_person_Shashank', function(req, res){
    Person.find({name: "shashank", age:22}, function(err, response){
        // console.log(response);
        res.json(response);
    })
})

app.get('/find_person_Indian', function(req, res){
    Person.find({nationality: "Indian"}, "name", function(err, response){
        // console.log(response);
        res.json(response);
    })
})



//UPDATING DOCUMENTS
//Model.update(condition, updates, callback)
//Model.findOneAndUpdate(condition, updates, callback)
//Model.findByIdAndUpdate(id, updates, callback)

app.listen(8081);