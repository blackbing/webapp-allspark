RT = React.addons.TestUtils

describe "main", ->
  div = document.createElement('div')
  div.id = 'app'
  window.document.body.appendChild(div)
  require("../../app/scripts/main")
  it "should be true", ->
    expect(true).toEqual true
    return
