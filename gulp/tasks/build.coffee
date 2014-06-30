gulp = require("gulp")
$ = require("gulp-load-plugins")()

done = ()->
  $.util.log 'All Done!'

# Build
gulp.task "build", ->
  runSequence = require('run-sequence')
  runSequence(
    'clean'
    [
      "browserify:build"
      "styles:build"
      "images"
      "fonts"
    ]
    'html'
    'chmod'
  , done)
