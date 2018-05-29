import React from 'react'

const Listing = ({ hero, address, price }) => {
    const listingStyle = {
        backgroundImage: 'url(' + hero + ')',
        backgroundSize: 'cover',
        backgroundRepeat: 'no-repeat'
    };

    return (
        <div className={'column is-narrow is-one-quarter home ' + (address ? '': 'loading')}>
            <div data-attribute="hero" style={address ? listingStyle : {}}></div>
            <p data-attribute="address">{ address }</p>
            <p data-attribute="price">{ price }</p>
        </div>
   );
};

export default Listing;
