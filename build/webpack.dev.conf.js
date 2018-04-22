var webpack = require('webpack'),
  config = require('./webpack.base.conf'),
  HtmlWebpackPlugin = require('html-webpack-plugin'),
  ExtractTextPlugin = require('extract-text-webpack-plugin'),
  BrowserSyncPlugin = require('browser-sync-webpack-plugin'),
  // SOURCE_MAP = true; // 大多数情况下用不到
  SOURCE_MAP = false;
  // antd定制主题
  var theme = require('../package.json').theme;
// var CommonsChunkPlugin = new webpack.optimize.CommonsChunkPlugin({	filename: "commons.js",name: "commons"});
config.output.filename = '[name]-.js';
config.output.chunkFilename = '[id]-.js';

config.devtool = SOURCE_MAP ? 'eval-source-map' : false;

// add hot-reload related code to entry chunk
config.entry.app = [
  'eventsource-polyfill',
  'webpack-hot-middleware/client?reload=true',
  'webpack/hot/only-dev-server',
  config.entry.app
];

config.output.publicPath = '/';

// 开发环境下直接内嵌 CSS 以支持热替换
config.module.loaders.push({
  test: /\.css$/,
  loader: 'style!css'
}, {
  test: /\.less$/,
  loader: `style!css!less?{"sourceMap":true,"modifyVars":${JSON.stringify(theme)}}`
}, {
  test: /\.scss$/,
  loader: 'style!css!sass'
});

config.plugins.push(
  new webpack.optimize.OccurenceOrderPlugin(),
  new webpack.HotModuleReplacementPlugin(),
  new webpack.NoErrorsPlugin(),
  new ExtractTextPlugin('[name].css'),
  new HtmlWebpackPlugin({
    filename: 'index.html',
    template: config.commonPath.indexHTML,
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: 'm.html',
    template:  'src/m.html',
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: 'login.html',
    template:  'src/login.html',
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: 'h5.html',
    template:  'src/h5.html',
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: 'wechat.html',
    template:  'src/wechat.html',
    chunksSortMode: 'none'
  }),
  new BrowserSyncPlugin({
    host: '127.0.0.1',
    port: 9090,
    proxy: 'http://127.0.0.1:9000/',
    logConnections: false,
    notify: false
  }, {
    reload: false
  }),
  new webpack.optimize.CommonsChunkPlugin({
    // 公共代码分离打包
    names: ['vendor', 'mainifest']
  })
);

module.exports = config;
