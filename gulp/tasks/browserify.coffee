gulp = require("gulp")
source = require('vinyl-source-stream')
browserify = require('browserify')

# Load plugins
$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

gulp.task "browserify", ->
  browserify(
    entries: ['./app/scripts/main.coffee']
    extensions: ['.coffee', '.hbs']
  )
  .bundle({debug: true})
  .on('error', (error)->console.error(error))
  .pipe(source('main.js'))
  .pipe( $.streamify($.gitversion()))
  .pipe gulp.dest(compiledPath + "/scripts/")

gulp.task "browserify:build", ->
  gulp.tasks["browserify"].fn()
  .pipe($.streamify($.uglify(outSourceMap: true)))
  .pipe( $.streamify($.gitversion()))
  .pipe gulp.dest("dist/scripts/")
