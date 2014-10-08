# @cjsx React.DOM

R = React.DOM

App = React.createClass
  onClick: ->
    alert('Splendid!')
  render: ->
    <div className="jumbotron">
      <div>
        <h1>{process.env.app_title}</h1>
        <p className="lead">Always a pleasure scaffolding your apps.</p>
        <p> <a className="btn btn-lg btn-success" href="#" onClick={@onClick}>Splendid!</a> </p>
      </div>
    </div>

module.exports =
  start: ->
    @component = React.renderComponent(App(), document.querySelector('#app'))
