'use strict';

const HtmlPlugin = require('html-webpack-plugin');
const path = require('path');

module.exports = {
  context: __dirname,

  entry: './src/index.js',

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: 'index.js'
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.elm']
  },

  module: {
    loaders: [{
      test: /\.(css|scss)$/,
      loaders: ['style', 'css']
    }, {
      test:    /\.html$/,
      exclude: /node_modules/,
      loader:  'file?name=[name].[ext]'
    }, {
      test:    /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      loader:  'elm-webpack?verbose=true&warn=true'
    }, {
      test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
      loader: 'url?limit=10000&mimetype=application/font-woff'
    }, {
      test: /\.(ttf|eot|svg|ico)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
      loader: 'file'
    }],

    noParse: /\.elm$/
  },

  devServer: {
    inline: true,
    stats: { colors: true }
  },

  plugins: [new HtmlPlugin({
    filename: './src/index.html',
    favicon: './src/favicon.ico'
  })]
};
