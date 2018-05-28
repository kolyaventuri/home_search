import PropTypes from 'prop-types';
import React from 'react';

export default class Home extends React.Component {
  static propTypes = {
    hero_image: PropTypes.string,
    first_line_address: PropTypes.string,
    list_price: PropTypes.number,
  };

  constructor(props) {
    super(props);

    this.state = {
        first_line_address: this.props.first_line_address,
        list_price: this.props.list_price
    };
  }

  update(props) {
    this.setState(props);
  }

  render() {
    if(!this.state.first_line_address) {
      return (
        <div className="home loading column is-narrow">
             <div className="hero"></div>
        </div>
      );
    } else {
      return (
        <div className="home column">
          <div class="hero"><img src={ this.state.hero_image} /></div>
          <p className="address">{ this.state.first_line_address }</p>
          <p className="listPrice">{ this.state.list_price }</p>
        </div>
      );
    }
  }
}