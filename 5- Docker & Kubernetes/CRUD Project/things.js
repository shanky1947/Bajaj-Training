var express = require('express');
var router = express.Router();

//DATABASE
var mongoose = require('mongoose');
mongoose.connect('mongodb://admin:password@mongodb/my-db');
var personSchema = mongoose.Schema({
    name: String,
    age: Number,
    nationality: String
});
var Person = mongoose.model("Person", personSchema);


//CREATE
router.get('/create', function(req, res){
    res.render('create');
});

router.post('/create', function(req, res){
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



//VIEW
//Model.find(conditions, callback)
//Model.findOne(conditions, callback)
//Model.findById(id, callback)

router.get('/view', function(req, res){
    res.render('view');
});

router.get('/view_all', function(req, res){
    Person.find(function(err, response){
        // console.log(response);
        res.json(response);
    });
});

router.post('/view_custom', function(req, res){
    var name=req.body.name;
    var age = req.body.age;
    var nationality = req.body.nationality;
    var customObj={};

    if(name) customObj.name=name;
    if(age) customObj.age=age;
    if(nationality) customObj.nationality=nationality;


    Person.find(customObj, function(err, response){
        res.json(response);
    })
})

//EXTRA- For knowledge
router.get('/find_person_Shashank', function(req, res){
    Person.find({name: "shashank", age:22}, function(err, response){
        // console.log(response);
        res.json(response);
    })
})

router.get('/find_person_Indian', function(req, res){
    Person.find({nationality: "Indian"}, "name", function(err, response){
        // console.log(response);
        res.json(response);
    })
})



//UPDATING DOCUMENTS
//Model.updateOne(condition, updates, callback)
//Model.updateMany(condition, updates, callback)
//Model.findByIdAndUpdate(id, updates, callback) -> Person.findByIdAndUpdate("507f1f77bcf86cd799439011", {name: "James"}

router.get('/update', function(req, res){
    res.render('update');
});

router.post('/update', function(req, res){
    var name=req.body.oname;
    var age = req.body.oage;
    var nationality = req.body.onationality;
    var ocustomObj={};

    if(name)  ocustomObj.name=name;
    if(age)   ocustomObj.age=age;
    if(nationality)  ocustomObj.nationality=nationality;

    name=req.body.nname;
    age = req.body.nage;
    nationality = req.body.nnationality;
    var ncustomObj={};

    if(name)  ncustomObj.name=name;
    if(age)   ncustomObj.age=age;
    if(nationality)  ncustomObj.nationality=nationality;

    console.log(ocustomObj);
    console.log(ncustomObj);
    Person.updateMany(ocustomObj, ncustomObj, function(err, response){
        console.log(response);
        res.redirect('view');
    });
});

//EXTRA- For knowledge
router.post('/updateid', function(req, res){
    Person.findByIdAndUpdate(req.body.id, req.body, function(err, response){
        if(err) res.json({message: "Error in updating person with id "+req.body.id})
        console.log(response);
    })
    res.redirect('/find_person');
});



//DELETING DOCUMENTS
//Model.remove(condition, [callback])
//Model.findOneAndRemove(condition, [callback])
//Model.findByIdAndRemove(id, [callback])

router.get('/delete', function(req, res){
    res.render('delete');
});

router.post('/delete', function(req, res){
    var name=req.body.name;
    var age = req.body.age;
    var nationality = req.body.nationality;
    var customObj={};

    if(name) customObj.name=name;
    if(age) customObj.age=age;
    if(nationality) customObj.nationality=nationality;

    Person.findOneAndRemove(customObj, function(err, response){
        console.log(response);
        res.redirect('view');
    });
});

module.exports = router;