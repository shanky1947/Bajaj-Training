const assert = require('assert');
const requestTime = require('../testing.js');

//UNIT TEST
//describe(title, callback) -> creates a suit 
describe('requestTime middleware', function(){
    //create a test with -> it(title, callback)
    it('should add a `requestTime` property to the `req` parameter', function(){
        // call function
        const req = {};
        requestTime(req, null, ()=>{});

        // make assertion
        assert.ok(req.requestTime>0);
    });
});

//INTEGRATION TEST