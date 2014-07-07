var helper = require('./support/helper');

describe('this example', function() {
  it('should import a helper module', function() {
    expect(helper).toEqual('helper.js');
  });
  it('should be true', function() {
    expect(true).toEqual(true);
  });
});
