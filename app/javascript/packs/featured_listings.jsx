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
