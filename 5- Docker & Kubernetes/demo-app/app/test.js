
var mongoose = require('mongoose');
mongoose.createConnection(
    "mongodb://localhost:27017/my-db",
    {
      "auth": {
        "authSource": "admin"
      },
      "user": "admin",
      "pass": "password"
    }
  );