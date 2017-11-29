
var express = require('express')
var app = express()
// var path = require('path')


// var cors = require('./middleware/cors');
// var bodyParser = require('body-parser');

// var autoRoutes = require('express-auto-routes'); // 路由插件

app.use(express.static('./')) // 将本文件夹转化为静态资源路由
// app.use(cors); // 跨域设置，如果用的上
// app.use(bodyParser.json()); //参数解析


// var routes = autoRoutes(app);
// routes(path.join(__dirname, './controller'));

/*
var log4js = require('log4js');


log4js.configure({
    appenders: [
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
    }
});
app.use(bodyParser.json());
var logger = log4js.getLogger('logInfo'); 

app.post('/log', function (req, res) {
    switch(req.body.level){
        case "info":
            logger.info(JSON.stringify(req.body));
            break;
        case "error":
            logger.error(JSON.stringify(req.body));
            break;
        case "fatal":
            logger.fatal(JSON.stringify(req.body));
            break;
        default:
            break;
    }
    res.json({logType: 'iii'});
});
*/
/*
app.get('*', (req, res) => { 
    res.sendFile(path.join(__dirname, 'index.html'))
})
*/
var port = process.env.port || 9091
app.listen(port, '0.0.0.0', function(err) {
    // console.log(err);
})

console.log('已启动，端口：' + port)
