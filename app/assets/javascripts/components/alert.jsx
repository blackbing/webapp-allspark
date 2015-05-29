let React = require('react')
let classNames = require('classnames')
let Alert = require('react-bootstrap').Alert;
let Button = require('react-bootstrap').Button;
let FadeMixin = require('react-bootstrap').FadeMixin;

const AlertDismissable = React.createClass({
  getInitialState() {
    return {
      bsStyle: 'warning',
      alertVisible: true
    };
  },
  componentDidMount(){
    this.getDOMNode().addEventListener('transitionend', this.onTransitionEnd)
  },

  render() {

    let classes = classNames('fade', 'in')
    if (this.state.alertVisible) {
    }else{
      classes = classNames('fade')
    }
    return (
      <Alert bsStyle={this.state.bsStyle} className={classes} onDismiss={this.handleAlertDismiss}>
        <h3>Welcome</h3>
        <p>Change this and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
      </Alert>
    );

  },
  onTransitionEnd(){
    console.log('onTransitionEnd')
    if(!this.state.alertVisible){
      this.getDOMNode().classList.add('collapse')
    }
  },

  handleAlertDismiss() {
    //console.log(this.getDOMNode());
    //this.getDOMNode().classList.add('fade')
    this.setState({alertVisible: false});
    //this.componentWillUnmount()
  },

  handleAlertShow() {
    this.setState({alertVisible: true});
  }
});

module.exports = AlertDismissable;
