gulp = require("gulp")
source = require('vinyl-source-stream')
minifyCSS = require('gulp-minify-css')

# Load plugins
$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

# Styles
gulp.task "styles", ->
  gulp.src("app/styles/**/*.scss")
  .pipe($.compass(
    project: "."
    config_file: "./config/compass.config.rb"
    css: compiledPath + "/styles"
    sass: "app/styles"
    relative: false
    bundle_exec: true
    debug: true
    #import_path: "app/bower_components"
  ))
  .pipe(gulp.dest(compiledPath + "/styles"))
  .pipe $.size()

gulp.task "styles:build", ->
  gulp.src("app/styles/**/*.scss")
  .pipe($.compass(
    project: "."
    config_file: "./config/compass.config.dist.rb"
    css: "dist/styles"
    sass: "app/styles"
    relative: false
    bundle_exec: true
    debug: true
    #import_path: "app/bower_components"
  ))
  .pipe(minifyCSS())
  .pipe( $.gitversion())
  .pipe(gulp.dest("dist/styles"))
  .pipe $.size()
