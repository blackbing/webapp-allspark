gulp = require("gulp")

$ = require("gulp-load-plugins")()
compiledPath = ".tmp"

# Connect
gulp.task "connect", ->
  proxy = require('proxy-middleware')
  url = require('url')
  $.connect.server(
    root: [
      compiledPath
      "app"
    ]
    port: 3000
    livereload: true
    #setting proxy for development
    #middleware: (connect, o)->
    #  api = url.parse('http://XXXX/api')
    #  api.route = '/api'

    #  [proxy(api), proxy(api_zero)]
  )
