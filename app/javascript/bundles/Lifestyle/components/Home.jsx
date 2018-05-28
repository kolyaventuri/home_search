import PropTypes from 'prop-types';
import React from 'react';

export default class Home extends React.Component {
  static propTypes = {
    first_line_address: PropTypes.string,
    list_price: PropTypes.number
  };

  constructor(props) {
    super(props);

    this.state = {
        first_line_address: this.props.first_line_address,
        list_price: this.props.list_price
    };
  }

  render() {
    return (
      <div className="home">
        <p className="address">{ this.state.first_line_address }</p>
        <p className="listPrice">{ this.state.list_price }</p>
      </div>
    );
  }
}