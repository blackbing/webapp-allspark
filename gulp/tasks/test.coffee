gulp = require("gulp")
exec = exec = require('child_process').exec
runSequence = require('run-sequence')

$ = require("gulp-load-plugins")()



gulp.task "test", (callback)->
  runSequence(
    'clean:test',
    ['browserify:test'],
    ->
      appRoot = "#{__dirname}/../../"
      karmaCommand = appRoot + './node_modules/karma/bin/karma'
      karmaConfig = appRoot + 'test/karma.conf.js'
      exec("#{karmaCommand} start #{karmaConfig}", (err, stdout, stderr)->
        $.util.log stdout
        $.util.log stderr
        callback(err)
      )
  )
