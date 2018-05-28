import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Home from '../bundles/Lifestyle/components/Home'
import 'whatwg-fetch'

document.addEventListener('DOMContentLoaded', () => {
  let featuredHomeContainer = document.querySelector('#featuredHomes')


  let featuredHomes = [];

  for(let i = 0; i < 10; i++) {
    featuredHomes.push(<Home key={i} />);
  }

  ReactDOM.render(
    featuredHomes,
    featuredHomeContainer,
    () => {
       getHomes(featuredHomes);
    }
  );
});

const getHomes = (elements) => {
  fetch('/api/v1/homes/featured').then(response => {
    return response.json();
  }).then(homes => {
    for(let i = 0; i < homes.length; i++) {
      let home = homes[i];
      console.log(home);
    }
  });
};