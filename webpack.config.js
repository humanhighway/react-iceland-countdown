webpack = require("webpack");
HtmlWebpackPlugin = require("html-webpack-plugin");

// IS_PRODUCTION = "production" === process.env.NODE_ENV;

webpackConfig = module.exports = {
  entry: ['./ls/app.ls'],
  // devtool: 'source-map',
  resolve: {
    extensions: ['', ".js", '.ls', '.cjsx'],
    modulesDirectories: [ 'node_modules' ]
  },
  output: {
    path: '',
    publicPath: './',
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.scss$/, loader: "style!css!sass" },
      { test: /\.js(x?)$/, loaders: ['jsx-loader?harmony'] },
      { test: /\.cjsx$/, loaders: ['livescript', 'cjsx']},
      { test: /\.ls$/, loader: 'livescript' }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'index-template.html',
      filename: 'index.html'
    })
  ]
};
