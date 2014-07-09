RT = React.addons.TestUtils

describe "main", ->
  div = document.createElement('div')
  div.id = 'app'
  window.document.body.appendChild(div)
  app = require("../../app/scripts/components/app")
  app.start()
  $app = $(app.component.getDOMNode())
  it "should have h1", ->
    expect($app.find('h1').text()).toEqual 'htccs-webapp'
    return
