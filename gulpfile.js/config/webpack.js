var path            = require('path')
var paths           = require('./')
var webpack         = require('webpack')
var webpackManifest = require('../lib/webpackManifest')


module.exports = function(env) {
  var jsSrc = path.resolve(paths.sourceAssets + '/javascripts/')
  var jsDest = paths.publicAssets + '/javascripts/'
  var publicPath = 'assets/javascripts/'
  var DEBUG = false;
  var STYLE_LOADER = 'style-loader/useable';
  var CSS_LOADER = DEBUG ? 'css-loader' : 'css-loader?minimize';
  var AUTOPREFIXER_LOADER = 'autoprefixer-loader?{browsers:' + JSON.stringify([
    'Android 2.3',
    'Android >= 4',
    'Chrome >= 20',
    'Firefox >= 24',
    'Explorer >= 8',
    'iOS >= 6',
    'Opera >= 12',
    'Safari >= 6']) + '}';

  var webpackConfig = {
    context: jsSrc,

    plugins: [],

    resolve: {
      modulesDirectories: ['bower_components', 'node_modules'],
      extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx']
    },

    module: {
      //preLoaders: [
      //  {
      //    test: /\.js$/,
      //    exclude: /node_modules/,
      //    loader: 'babel-loader'
      //  }
      //],

      loaders: [
        {
          test: /\.css$/,
          loader: STYLE_LOADER + '!' + CSS_LOADER + '!' + AUTOPREFIXER_LOADER
        },
        {
          test: /\.less$/,
          loader: STYLE_LOADER + '!' + CSS_LOADER + '!' + AUTOPREFIXER_LOADER +
                  '!less-loader'
        },
        {
          test: /\.gif/,
          loader: 'url-loader?limit=10000&mimetype=image/gif'
        },
        {
          test: /\.jpg/,
          loader: 'url-loader?limit=10000&mimetype=image/jpg'
        },
        {
          test: /\.png/,
          loader: 'url-loader?limit=10000&mimetype=image/png'
        },
        {
          test: /\.svg/,
          loader: 'url-loader?limit=10000&mimetype=image/svg+xml'
        },
        {
          test: /\.jsx?$/,
          exclude: /node_modules/,
          loader: 'babel-loader'
        }
      ]
    }
  }

  if(env !== 'test') {
    // Karma doesn't need entry points or output settings
    webpackConfig.entry= {
      page1: [ './page1.js' ],
      page2: [ './page2.js' ]
    }

    webpackConfig.output= {
      path: jsDest,
      filename: env === 'production' ? '[name]-[hash].js' : '[name].js',
      publicPath: publicPath
    }

    // Factor out common dependencies into a shared.js
    webpackConfig.plugins.push(
      new webpack.optimize.CommonsChunkPlugin({
        name: 'shared',
        filename: env === 'production' ? '[name]-[hash].js' : '[name].js',
      })
    )
  }

  if(env === 'development') {
    webpackConfig.devtool = 'source-map'
    webpack.debug = true
  }

  if(env === 'production') {
    webpackConfig.plugins.push(
      new webpackManifest(publicPath, 'public'),
      new webpack.DefinePlugin({
        'process.env': {
          'NODE_ENV': JSON.stringify('production')
        }
      }),
      new webpack.optimize.DedupePlugin(),
      new webpack.optimize.UglifyJsPlugin(),
      new webpack.NoErrorsPlugin()
    )
  }

  return webpackConfig
}
