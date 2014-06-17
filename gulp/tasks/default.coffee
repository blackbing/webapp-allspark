gulp = require("gulp")

# Default task
gulp.task "default", ["clean"], ->
  gulp.start "build"
  return
