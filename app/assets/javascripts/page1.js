let App = require('./components/app.jsx')
let User = require('./components/user.jsx')
let React = require('react')
React.render(<App />, document.getElementById('app'));
React.render(<User />, document.getElementById('user'));

//let alertAsyncMessage = function() {
//  // CommonJS async syntax webpack magic
//  require.ensure([], function() {
//    const message = require("./asyncMessage")
//    alert(exclaimify(message))
//  })
//}

//console.log(`
//  asset references like this one:
//    assets/images/gulp.png
//  get updated in js too!`)

//button.addEventListener('click', alertAsyncMessage)
