
module.exports = function (req, res, next) {
    var log4js = require('log4js');
    log4js.configure({
        appenders: [
            {
                type: 'console',
                category: "console"

            },
            {
                type: "dateFile",
                filename: "/opt/logs/node/webcashier",
                pattern: "yyyyMMdd.log",
                // absolute: false,
                alwaysIncludePattern: true,
                // maxLogSize: 20480,
                // backups: 3,
                category: 'logInfo'
            }//日期文件格式
        ],
        replaceConsole: true,   //替换console.log
        levels:{
            logInfo: 'info', //info及以上级别输出到日志文件
            console: 'debug'
        }
    });
    var logger = log4js.getLogger('logInfo'); 
    // console.info('[LOG]', req.method, req.originalUrl);
    logger.debug(req.method)
    logger.info(req.method, req.originalUrl);
    next();
  };
  