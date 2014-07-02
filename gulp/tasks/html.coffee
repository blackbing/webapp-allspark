gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

##require uncache module
_require = (module)->
  delete require.cache[require.resolve(module)]
  return require(module)

# HTML
gulp.task "usemin", ->
  all_config = _require("../../config/all_config")

  gulp.src("app/*.html")
  .pipe($.template(all_config))
  .pipe( $.usemin(
    css: [$.csso(), $.minifyCss(), 'concat', $.rev()]
    html: [$.minifyHtml(empty: false)]
    js: [$.uglify(), $.rev()]
  ))
  .pipe(gulp.dest("dist"))
  .pipe $.size()


gulp.task "html", ["usemin"], ->
  gulp.src('dist/*.html')
  .pipe( $.gitversion())
  .pipe( gulp.dest('dist/'))
