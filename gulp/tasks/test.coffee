gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

# Clean
gulp.task "test", ->
  gulp.src([
    "test/test.js"
  ])
  .pipe( $.karma(
    configFile: 'karma.conf.js'
    action: 'run'
  ))
  .on 'error', (err)->
    throw err

