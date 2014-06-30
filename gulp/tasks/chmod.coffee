gulp = require("gulp")
# Load plugins
$ = require("gulp-load-plugins")()

gulp.task "chmod-build", ->
  gulp.src('dist/**/*')
  .pipe( $.chmod(644))
  .pipe( gulp.dest('.dist'))

gulp.task "chmod-dist", ->
  gulp.src('.dist/**/*')
  .pipe( gulp.dest('dist'))

gulp.task "chmod", (callback)->
  runSequence = require('run-sequence')

  runSequence(
    'chmod-build'
    'clean' #clean dist for write
    'chmod-dist'
  , ->
    gulp.src(".dist/**/*.*",
      read: false
    )
    .pipe $.rimraf()
    callback()
  )





