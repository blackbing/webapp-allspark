`/** @jsx React.DOM */`
R = React.DOM

App = React.createClass
  render: ->
    R.h1 null, 'gulp-htccs-webapp'

module.exports =
  start: ->
    React.renderComponent(`<App />`, document.querySelector('#app'))
