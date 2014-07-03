
R = React.DOM

App = React.createClass
  displayName: 'App'
  render: ->
    R.div( className:"jumbotron",
      R.div( null, R.h1(null, process.env.app_title))
      R.p( {className:"lead"}, process.env.app_body)
      R.p(null, R.a( {className:"btn btn-lg btn-success", href:"#"}, "Splendid!"))
    )
module.exports =
  start: ->
    React.renderComponent(App(), document.querySelector('#app'))
