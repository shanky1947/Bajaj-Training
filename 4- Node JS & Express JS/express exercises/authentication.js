var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer(); 
var session = require('express-session');
var cookieParser = require('cookie-parser');

app.set('view engine', 'pug');
app.set('views','./views');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); 
app.use(upload.array());
app.use(cookieParser());
app.use(session({secret: "Your secret key", resave:true, saveUninitialized: true}));

var Users = [];

app.get('/signup', function(req, res){
    res.render('signup');
});

app.post('/signup', function(req, res){
    if(!req.body.id || !req.body.password){
        res.status("400");
        res.send("Invalid details!");
    }
    else{
        //Array.filter(function(temp_varible){})
        //temp_variable will be of type of each value of array
        //it returns an array of values satisfying condition giving in the codition iinside function
        //it is similar to for each loop
        Users.filter(function(user){
            if(user.id === req.body.id){
                res.render('signup', {message: "User already exist! Login ot choose another user id"});
            }
        });
        var newUser = {id: req.body.id, password: req.body.password};
        Users.push(newUser);
        req.session.user = newUser;
        res.redirect('/protected_page');
    }
});

function checkSignIn(req, res, next){
    //Kind of error handling
    if(req.session.user){
        next(); //If session exists proceed to page
        //will go to res render protected page
    }
    else{
        var err = new Error("Not logged in!");
        console.log(req.session.user);
        next(err);  //Error, trying to acces unauthorized page!
        //will go to app.use route, as it has error parameter
    }
};

app.get('/protected_page', checkSignIn, function(req, res){
    res.render('protected_page', {id:req.session.user.id});
});

app.use('/protected_page', function(err, req, res, next){
    console.log(err);
    //User should be authenticated, Redirect him to login page
    res.redirect('/login');
});

app.get('/login', function(req, res){
    res.render('login');
});

app.post('/login', function(req, res){
    console.log(Users);
    if(!req.body.id || !req.body.password){
        res.render('login', {message: "Please enter both id and password"});
    }
    else{
        Users.filter(function(user){
            if(user.id === req.body.id && user.password === req.body.password){
                req.session.user=user;
                res.redirect('/protected_page');
            }
            else   
                res.render('login', {message: "Invalid credentials!"});
        });
    }
});

app.get('/logout', function(req, res){
    req.session.destroy(function(){
        console.log("user logged out.");
    });
    res.redirect('/login');
})


app.listen(3000);