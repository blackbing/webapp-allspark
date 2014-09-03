gulp = require("gulp")
source = require('vinyl-source-stream')
browserify = require('browserify')
exorcist   = require('exorcist')
map = require('vinyl-map')
path = require('path')
mold = require('mold-source-map')

# Load plugins
$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

get_name = (filename)->
  appRoot = "#{__dirname}/"
  fname = filename.replace(appRoot, '')

  fname.substring(fname.lastIndexOf('/')+1, fname.lastIndexOf('.'))

get_path = (filename)->
  appRoot = path.normalize("#{__dirname}/../../")
  fname = filename.replace(appRoot, '')
  fname.substring(0, fname.lastIndexOf('/')+1)

gulp.task "browserify", (callback)->
  bundleApp = map( (contents, filename)->
    fname = get_name(filename)
    browserify(
      entries: [filename]
      extensions: ['.coffee']
    )
    .bundle({debug: true})
    .on('error', $.util.log )
    .pipe(mold.transformSourcesRelativeTo(""))
    .pipe(exorcist(compiledPath + "/scripts/#{fname}.js.map"))
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
    .pipe( $.streamify($.uglifyjs(outSourceMap: true)))
    .pipe gulp.dest(compiledPath + "/scripts/")
  )

  gulp.src('app/scripts/*.coffee')
  .pipe(bundleApp)

gulp.task "browserify:test", (callback)->
  bundleApp = map( (contents, filename)->
    fname = get_name(filename)
    fpath = get_path(filename)
    browserify(
      entries: [filename]
      extensions: ['.coffee']
    )
    .bundle({debug: true})
    .on('error', $.util.log )
    .pipe(source("#{fname}.js"))
    .pipe gulp.dest(compiledPath + '/' +fpath)
  )

  gulp.src('test/spec/**/*.coffee')
  .pipe(bundleApp)
