var express = require('express');
var router = express.Router();


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

router.get('/find_person', function(req, res){
    Person.find(function(err, response){
        // console.log(response);
        res.json(response);
    });
});

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

router.get('/update_age', function(req, res){
    Person.updateOne({age: 22}, {nationality: "American"}, function(err, response){
        console.log(response);
    });
});

router.get('/update_by_id', function(req, res){
    res.render('update');
});

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

module.exports = router;