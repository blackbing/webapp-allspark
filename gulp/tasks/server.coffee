gulp = require("gulp")

# Load plugins
$ = require("gulp-load-plugins")()

# Watch
gulp.task "server", ["connect"], ->

  global.isWatching = true
  # Watch for changes in `app` folder
  gulp.watch [
    ".tmp/*.html"
    ".tmp/styles/**/*.css"
    "app/scripts/**/*.js"
    ".tmp/scripts/**/*.js"
    "app/images/**/*"
  ], (event) ->
    gulp.src(event.path)
    .pipe $.connect.reload()
    #.pipe $.notify( message:'reload')


  # Watch .scss files
  gulp.watch "app/styles/**/*.scss", ["styles"]
  gulp.start "styles"

  # Watch .js files
  #gulp.watch [
  #  "app/scripts/**/*.coffee"
  #  "app/scripts/**/*.hbs"
  #  "app/scripts/**/*.js"
  #  "config/conf/*.json"
  #], ["browserify"]
  gulp.start "browserify"

  # Watch image files
  gulp.watch "app/images/**/*", ["images"]

  # Watch html files
  gulp.watch [
    "app/*.html"
    "config/conf/*.json"
  ], ["template"]
  gulp.start "template"
  return
