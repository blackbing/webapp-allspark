
let React = require('react')
let Navbar = require('./navbar.jsx')
let HelloMessage= require('./hello.jsx')
let Alert = require('./alert.jsx')

module.exports = React.createClass({
  render() {
     return <div>
       <Alert />
       <Navbar />
     </div>
  }
});
