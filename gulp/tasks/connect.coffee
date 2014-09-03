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
      #for link to right source map
      "./"
    ]
    port: 3000
    livereload: true,
    middleware: (connect, o)->
      api_reportabuse = url.parse('http://sb-test-review.usw1.cs-htc.net:8089')
      api_reportabuse.route = '/api_reportabuse'

      api_zero =  url.parse('https://zero-test.sense-cs.com/')
      api_zero.route = '/api_zero'

      [proxy(api_reportabuse), proxy(api_zero)]
  )
