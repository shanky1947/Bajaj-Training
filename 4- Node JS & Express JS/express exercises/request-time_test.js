//UNIT TEST
module.exports = (req, res, next) => {
    req.requestTime = Date.now();
    next();
};

// module.exports = (req, res) => {
//     req.message = "Shashank is 23 years old";
// };