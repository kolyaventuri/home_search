import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ListingSearchResults from '../bundles/Lifestyle/components/ListingSearchResults'
import 'whatwg-fetch'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ListingSearchResults />,
    document.querySelector('#homes')
  );
});
