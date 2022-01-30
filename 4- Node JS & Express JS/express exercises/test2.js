//INTEGRATION TEST
const express = require('express');
const app = express();

// const request_time = require('./request-time_test');
app.use(require('./test1'));

app.get('/unix-timestamp', (req, res) => {
    res.json({timestamp: Math.floor(req.requestTime / 1000)});
});

module.exports = app.listen(3000, () => {
        console.log('Example app listening on port 3000!');
});