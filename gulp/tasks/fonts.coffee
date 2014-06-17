gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

gulp.task('fonts', ->
  $.bowerFiles()
  .pipe($.filter('**/*.{eot,svg,ttf,woff}'))
  .pipe($.flatten())
  .pipe(gulp.dest('dist/fonts'))
  .pipe($.size())
)
