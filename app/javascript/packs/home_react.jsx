import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Home from '../bundles/Lifestyle/components/Home'
import 'whatwg-fetch'

document.addEventListener('DOMContentLoaded', () => {
  fetch('/api/v1/homes/featured').then(response => {
    return response.json();
  }).then(json => {
    console.log(json);
  });

  ReactDOM.render(
    <Home list_price={10} first_line_address="Address" />,
    document.body.appendChild(document.createElement('div')),
  );
})
