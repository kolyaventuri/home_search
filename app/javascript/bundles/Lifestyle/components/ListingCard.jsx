import React from 'react'

const Listing ({ hero, address, price)) => (
    <div class="home">
        <div data-attribute="hero"><img src={hero} /></div>
        <p data-attribute="address">{ address }</p>
        <p data-attribute="price">{ price }</p>
    </div>
);

export default Listing;
