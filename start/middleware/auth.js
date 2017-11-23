module.exports = function (req, res, next) {
    
    if (!req.session.userData) {
      return next({
        _status: 401,
        _msg: '请求错误'
      });
    }
  
    next();
  };
  