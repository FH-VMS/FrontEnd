var api =require('../service/APIs');
var authentication = require('../middleware/auth');

// GET /get
exports.get = {
url: '/get',
handler: function (req, res, next) {
  // the logic of this demo is so simple that
  // only `author` in the query condition
 
  api.Base.GetAll({city: '杭州'}).then((msg)=>{
    console.log(msg);
    res.send(msg);
  })
  /*
  var queryBody;
  if (req.query.author) {
    queryBody = { author: req.query.author };
  }
  */
  // res.send(req.query.id);
  // res.json( msgService.find({ query: queryBody, paging: pagingBody }) );
}
};

// post new message
// POST /post
exports.post = {
url: '/post',
middlewares: authentication,
handler: function (req, res, next) {

  res.json(true);
}
};

// modify message
// PUT /put/
exports.put = {
url: '/put',
// params: ':id',
middlewares: authentication,
handler: function (req, res, next) {

  res.json(true);
}
};

// DELETE /delete/
exports.delete = {
url: '/delete',
middlewares: authentication,
handler: function (req, res, next) {

  res.json(true);
}
};
