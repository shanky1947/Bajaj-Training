const assert = require('assert');
const app = require('../index');
const request = require('supertest');
const expect = require('expect');

describe('POST /main method 1', function(){
    it('should redirect to correct mentioned page', async function(){
        const input = {label:'v'};
        const text="shashank";
        return request(app)
            .post('/main')
            .send(input)
            .expect(302)
            .then(function(res){
                assert.ok(res.header['location'] == "/things/view");
                // expect(res.body.message).toBe("Redirect to view page");
            });
    });
});
describe('POST /main method 2', function(){
    it('should redirect to correct mentioned page',  function(done){
        const input = {label:'v'};
        const text="shashank";
        request(app)
            .post('/main')
            .send(input)
            .expect(302)
            .end(function(err, res){
                assert.ok(res.header['location'] == "/things/view");
                done();
            });
    });
});
describe('POST /main method 3', function(){
    it('should redirect to correct mentioned page', async function(){
        const input = {label:'v'};
        const text="shashank";
        const response = await request(app).post('/main').send(input)
        assert.ok(response.header['location'] == "/things/view");
    });
});

describe('POST /create', function(){
    it('should create new user information correctly', function(){
        var input = {};
        return request(app)
            .post('/things/create')
            .send(input)
            .expect(200)
            .then(function(res){
                expect(res.text).toContain("Sorry, you provided wrong info");
            })
    })
})