gulp = require("gulp")

# Build
gulp.task "build", [
  "browserify:build"
  "styles:build"
  "html"
  "images"
  "fonts"
]
