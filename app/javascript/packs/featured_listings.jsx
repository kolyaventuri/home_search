import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ListingCards from '../bundles/Lifestyle/components/ListingCards'
import 'whatwg-fetch'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ListingCards />,
    document.querySelector('#featuredHomes')
  );
});

const getHomes = (elements) => {
  fetch('/api/v1/homes/featured').then(response => {
    return response.json();
  }).then(homes => {
    for(let i = 0; i < homes.length; i++) {
      let home = homes[i];
      let element = elements[i];
      element.setState({
        address: home.first_line_address,
        list_price: home.list_price 
      });
    }
  });
};
