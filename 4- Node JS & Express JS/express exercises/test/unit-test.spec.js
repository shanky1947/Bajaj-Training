const assert = require('assert');
const requestTime = require('../request-time_test.js');

//UNIT TEST
// describe(title, callback) -> creates a suit 
describe('requestTime middleware', function(){
    //create a test with -> it(title, callback)
    it('should add a `requestTime` property to the `req` parameter', function(){
        // call function
        const req = {};
        requestTime(req, null);

        // make assertion
        assert.ok(req.requestTime>0);
    });
});

// describe('return name and age function', function(){
//     it('should output name and age correctly', function(){
//         const req = {};
//         requestTime(req, null);

//         assert.ok(req.message === "Shashanks is 23 years old");
//     });
// });

