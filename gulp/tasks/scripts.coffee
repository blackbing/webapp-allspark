gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

# Scripts
gulp.task "scripts", ->
  gulp.src("app/scripts/**/*.js")
  .pipe($.jshint(".jshintrc"))
  .pipe($.jshint.reporter("default"))
  .pipe $.size()
