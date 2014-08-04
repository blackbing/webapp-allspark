// Karma configuration
// Generated on Mon Jun 10 2013 09:57:07 GMT-0500 (CDT)

module.exports = function(config) {
  var reportUrl = './report/';
  config.set({

    // base path, that will be used to resolve files and exclude
    basePath: '../',


    // frameworks to use
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
      'test/polyfill/*.js',
      'app/bower_components/jquery/dist/jquery.js',
      'app/bower_components/react/react-with-addons.js',
      '.tmp/test/spec/**/*.js'
    ],


    // list of files to exclude
    exclude: [

    ],


    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['dots', 'progress', 'junit', 'html'],

    junitReporter: {
      outputFile: reportUrl + 'junit/test-results.xml',
      suite: ''
    },

    // web server port
    port: 9876,


    // cli runner port
    runnerPort: 9100,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_DEBUG,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['PhantomJS'],


    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: true,

    // the default configuration
    htmlReporter: {
      outputDir: reportUrl + 'junit',
      templatePath: 'node_modules/karma-html-reporter/jasmine_template.html'
    }

    // Add browserify to preprocessors
    //preprocessors: {'test/spec/**/*.coffee': ['browserify']}

    // Not required if you've installed karma-browserify via npm.
    //plugins: ['karma-*', require('../')]

  });
};
