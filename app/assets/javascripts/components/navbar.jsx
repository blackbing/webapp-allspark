
let React = require('react')
let TabbedArea = require('react-bootstrap').TabbedArea;
let TabPane = require('react-bootstrap').TabPane;
let Promotion = require('./promotion.jsx');
let Message = require('./message.jsx');
let Vendors = require('./vendors.jsx');
let Products = require('./products.jsx');
let Add = require('./add.jsx');
module.exports = React.createClass({
  getInitialState() {
    return {
      key: 1
    };
  },

  handleSelect(key) {
    this.setState({key});
  },

  render() {
    return (
      <TabbedArea activeKey={this.state.key} onSelect={this.handleSelect}>
        <TabPane eventKey={1} tab='promotion'><Promotion /></TabPane>
        <TabPane eventKey={2} tab='message'><Message /></TabPane>
        <TabPane eventKey={4} tab='vendors'><Vendors /></TabPane>
        <TabPane eventKey={5} tab='products'><Products /></TabPane>
        <TabPane eventKey={6} tab='add'><Add /></TabPane>
      </TabbedArea>
    );
  }
});
