gulp = require("gulp")
source = require('vinyl-source-stream')
browserify = require('browserify')
map = require('vinyl-map')

# Load plugins
$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

get_name = (filename)->
  appRoot = "#{__dirname}/"
  fname = filename.replace(appRoot, '')

  fname.substring(fname.lastIndexOf('/')+1, fname.lastIndexOf('.'))

gulp.task "browserify", (callback)->
  bundleApp = map( (contents, filename)->
    fname = get_name(filename)
    browserify(
      entries: [filename]
      extensions: ['.coffee']
    )
    .bundle({debug: true})
    .on('error', $.util.log )
    .pipe(source("#{fname}.js"))
    .pipe gulp.dest(compiledPath + "/scripts/")
  )

  gulp.src('app/scripts/*.coffee')
  .pipe(bundleApp)

gulp.task "browserify:build", ->
  bundleApp = map( (contents, filename)->
    fname = get_name(filename)
    browserify(
      entries: [filename]
      extensions: ['.coffee']
    )
    .bundle({debug: true})
    .on('error', $.util.log )
    .pipe(source("#{fname}.js"))
    .pipe( $.streamify($.uglify(outSourceMap: true)))
    .pipe gulp.dest(compiledPath + "/scripts/")
  )

  gulp.src('app/scripts/*.coffee')
  .pipe(bundleApp)

gulp.task "browserify:test", (callback)->
  bundleApp = map( (contents, filename)->
    fname = get_name(filename)
    browserify(
      entries: [filename]
      extensions: ['.coffee']
    )
    .bundle({debug: true})
    .on('error', $.util.log )
    .pipe(source("#{fname}.js"))
    .pipe gulp.dest(compiledPath + "/test/spec")
  )

  gulp.src('test/spec/**/*.coffee')
  .pipe(bundleApp)
