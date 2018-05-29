import React from 'react'

const Listing = ({ hero, address, price }) => (
    <div className={'column is-narrow home ' + (address ? '': 'loading')}>
        <div data-attribute="hero"><img src={hero} /></div>
        <p data-attribute="address">{ address }</p>
        <p data-attribute="price">{ price }</p>
    </div>
);

export default Listing;
