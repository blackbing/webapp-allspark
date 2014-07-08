gulp = require("gulp")
exec = exec = require('child_process').exec

$ = require("gulp-load-plugins")()

gulp.task "test", (callback)->
  karmaCommand = './node_modules/karma/bin/karma'
  karmaConfig = 'karma.conf.js'
  exec("#{karmaCommand} start #{karmaConfig}", (err, stdout, stderr)->
    $.util.log stdout
    $.util.log stderr
    callback(err)
  )
