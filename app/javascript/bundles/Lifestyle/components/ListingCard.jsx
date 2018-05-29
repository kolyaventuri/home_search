import React from 'react'
import Price from './Price'

const Listing = ({ hero, address, price }) => {
    const listingStyle = {
        backgroundImage: 'url(' + hero + ')',
        backgroundSize: 'cover',
        backgroundRepeat: 'no-repeat'
    };

    return (
        <div className={'column is-narrow is-one-quarter home ' + (address ? '': 'loading')}>
            <div className="hero" style={address ? listingStyle : {}}></div>
            <div className='info'>
                <p className="address">{ address }</p>
                <Price>{ price }</Price>
            </div>
        </div>
   );
};

export default Listing;
