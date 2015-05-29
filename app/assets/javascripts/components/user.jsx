
let React = require('react')

module.exports = React.createClass({
  login() {
    console.log('login')
  },
  logout(e) {
    e.preventDefault()
    console.log('logout')
  },
  render() {
     return (
       <ul className="nav navbar-nav navbar-right">
         <li><a href="#" ><i className="fa fa-user"></i> Hello World</a></li>
         <li><a href="#" onClick={this.logout}>Logout <i className="fa fa-sign-out"></i></a></li>
       </ul>
     )

  }
});
