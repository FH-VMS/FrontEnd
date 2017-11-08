var webpack = require('webpack'),
  config = require('./webpack.base.conf'),
  HtmlWebpackPlugin = require('html-webpack-plugin'),
  CopyWebpackPlugin = require('copy-webpack-plugin'),
  CleanWebpackPlugin = require('clean-webpack-plugin'),
  ExtractTextPlugin = require('extract-text-webpack-plugin'),
  SOURCE_MAP = false;

  //var CommonsChunkPlugin = new webpack.optimize.CommonsChunkPlugin({	filename: "commons.js",name: "commons"});
// console.log('ddddddddddddddd', __RELEASE__)

config.output.filename = '[name]-[hash:6].js';
config.output.chunkFilename = '[id]-[chunkhash:6].js';
//若为发布 引用的js图片换成绝对路径
var nowEnv = process.env.NODE_ENV;
if(nowEnv == 'release') {
  config.output.publicPath = 'http://www.fy-cn.top/p/static/';
}


config.devtool = SOURCE_MAP ? 'source-map' : false;

// 生产环境下分离出 CSS 文件
config.module.loaders.push({
  test: /\.css$/,
  loader: ExtractTextPlugin.extract('style', 'css')
}, {
  test: /\.less$/,
  loader: ExtractTextPlugin.extract('style', 'css!less')
}, {
  test: /\.scss$/,
  loader: ExtractTextPlugin.extract('style', 'css!sass')
});

config.plugins.push(
  /*
  new CleanWebpackPlugin('dist', {
    root: config.commonPath.rootPath,
    verbose: false
  }),
  new CopyWebpackPlugin([ // 复制高度静态资源
    {
      from: config.commonPath.staticDir,
      ignore: ['*.md']
    }
  ]),
  new webpack.optimize.DedupePlugin(),
  new webpack.optimize.UglifyJsPlugin({
    compress: {
      warnings: false
    }
  }),
  new webpack.optimize.OccurenceOrderPlugin(),
  new webpack.optimize.CommonsChunkPlugin({
    // 公共代码分离打包
    names: ['vendor', 'mainifest']
  }),
  new ExtractTextPlugin('[name].[contenthash:6].css', {
    allChunks : true // 若要按需加载 CSS 则请注释掉该行
  }),
  new HtmlWebpackPlugin({
    filename: '../index.html',
    template: config.commonPath.indexHTML,
    chunksSortMode: 'none'
  })
  */
   new CleanWebpackPlugin('dist', {
    root: config.commonPath.rootPath,
    verbose: false
  }),
  new webpack.optimize.OccurenceOrderPlugin(),
  new webpack.HotModuleReplacementPlugin(),
  new webpack.NoErrorsPlugin(),
  new ExtractTextPlugin('[name].css'),
  new HtmlWebpackPlugin({
    filename: '../index.html',
    template: config.commonPath.indexHTML,
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: '../login.html',
    template:  'src/login.html',
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: '../m.html',
    template:  'src/m.html',
    chunksSortMode: 'none'
  }),
  new HtmlWebpackPlugin({
    filename: '../h5.html',
    template:  'src/h5.html',
    chunksSortMode: 'none'
  }),
  new CopyWebpackPlugin([ // 复制高度静态资源
    {
      from: config.commonPath.staticDir,
      ignore: ['*.md']
    }
  ]),
  new webpack.optimize.UglifyJsPlugin({
    compress: {
      warnings: false
    }
  }),
  new webpack.optimize.CommonsChunkPlugin({
    // 公共代码分离打包
    names: ['vendor', 'mainifest']
  })
);

module.exports = config;
