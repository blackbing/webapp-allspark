let React = require('react')
let HelloMessage = React.createClass({
    render: function() {
          return <div>Hello {this.props.name}</div>;
            }
});

module.exports = HelloMessage;
