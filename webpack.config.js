var webpack = require('webpack'),
    path = require('path'),
    HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  context: path.resolve(__dirname, '.'),
  entry: [
    'webpack-dev-server/client?http://localhost:8080',
    path.resolve(__dirname, 'src/index')
  ],
  output: {
    path: path.resolve(__dirname, 'dist/js'),
    filename: '[name].js',
    publicPath: ''
  },
  devtool: 'eval-source-maps',
  resolve: {
    extensions: ['.elm','.js']
  },
  plugins: [
    new HtmlWebpackPlugin({
      filename: path.resolve(__dirname, 'index.html')
    })
  ],
  module: {
    rules: [
      {
        test: /\.elm$/,
        loader: 'elm-webpack-loader'
      }
    ]
  }
};
