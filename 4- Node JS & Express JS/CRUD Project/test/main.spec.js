const assert = require('assert');
const app = require('../index');
const request = require('supertest');

describe('POST /main', function(){
    it('should redirect to correct mentioned page', function(){
        var input = {label:'v'};
        request(app)
            .post('/main')
            .send(input)
            .expect(200)
            .then(function(res){
                assert.ok(res.body.message === "Redirect to view page");
            });
    });
});