gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

# Clean
gulp.task "clean", ->
  gulp.src([
    "dist/**/*.*"
    "public/**/*.*"
  ],
    read: false
  )
  .pipe $.rimraf()
