helper = require("./support/helper")
auth = require("../../app/scripts/service/auth")

describe "this example", ->
  it "should import a helper module", ->
    expect(helper).toEqual "helper.js"
    return

  it "should be true", ->
    expect(true).toEqual true
    return

  return

describe "service/auth", ->
  it "should be login", ->
    expect(auth.login()).toEqual('login')
  it "should be logout", ->
    expect(auth.logout()).toEqual('logout')
