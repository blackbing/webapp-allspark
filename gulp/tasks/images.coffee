gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

# Images
gulp.task "images", ->

  #.pipe($.cache($.imagemin({
  #    optimizationLevel: 3,
  #    progressive: true,
  #    interlaced: true
  #})))
  gulp.src([
    "app/images/**/*"
    compiledPath + "/images/**/*"
  ])
  .pipe(gulp.dest("dist/images"))
  .pipe $.size()
