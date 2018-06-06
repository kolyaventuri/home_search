import React from 'react'
import ReactDOM from 'react-dom'
import FavoriteListings from '../bundles/Lifestyle/components/FavoriteListings'
import 'whatwg-fetch'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <FavoriteListings />,
    document.querySelector('#homes')
  );
});
