gulp = require("gulp")
$ = require("gulp-load-plugins")()

# Build
gulp.task "build", (callback)->
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
  , ->
    $.util.log $.util.colors.cyan 'All build tasks done!'
    callback()
  )
