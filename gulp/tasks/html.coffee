gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

##require uncache module
_require = (module)->
  delete require.cache[require.resolve(module)]
  return require(module)

# HTML
gulp.task "html", ->
  all_config = _require("../../config/all_config")
  cssFilter = $.filter('**/*.css')

  gulp.src("app/*.html")
  .pipe($.swig(data: all_config))
  .pipe($.useref.assets())
  .pipe(cssFilter)
  .pipe($.csso())
  .pipe(cssFilter.restore())
  .pipe($.useref.restore())
  .pipe($.useref())
  .pipe(gulp.dest("dist"))
  .pipe $.size()

  #append git version finally
  gulp.src('dist/*.html')
  .pipe( $.gitversion())
  .pipe(gulp.dest("dist"))
