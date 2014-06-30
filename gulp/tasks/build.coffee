gulp = require("gulp")

done = ()->
  console.log 'All Done!'

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
