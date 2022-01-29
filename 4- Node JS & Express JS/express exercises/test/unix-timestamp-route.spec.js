//INTEGRATION TEST
const assert = require('assert');
const app = require('../index_test');
const request = require('supertest');

describe('GET /unix-timestamp', function(){
    it('should respond with JSON object containing timestamp', function(done){
        request(app).get('/unix-timestamp').expect(200).end((err, res)=>{
            if(err)
                return done(err);
            assert.ok(res.body.timestamp<1e10);
            done();
        });
    });
});

//2nd Method- Promise style
// describe('GET /unix-timestamp', function(){
//     it('should respond with JSON object containing timestamp', function(){
//         request(app).get('/unix-timestamp').expect(200).then(res => {
//             assert.ok(res.body.timestamp < 1e10);
//         });
//     });
// });