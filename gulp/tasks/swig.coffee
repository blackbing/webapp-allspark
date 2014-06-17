gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

##require uncache module
_require = (module)->
  delete require.cache[require.resolve(module)]
  return require(module)

# swig
gulp.task "swig", ->
  all_config = _require("../../config/all_config")

  console.log all_config
  gulp.src("app/*.html")
  .pipe($.swig(data: all_config))
  .pipe gulp.dest(compiledPath + "/")
