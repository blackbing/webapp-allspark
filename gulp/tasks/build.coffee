gulp = require("gulp")

# Build
gulp.task "build", [
  "browserify:build"
  "styles:build"
  "images"
  "fonts"
], ->
  gulp.start "html"
