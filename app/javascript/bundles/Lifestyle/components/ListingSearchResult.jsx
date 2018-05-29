import React from 'react'
import ListingPhoto from './listing/Photo'
import BasicInfo from './listing/BasicInfo'

const Listing = ({ hero, address, price, baths, beds, garage, sqft, lot_size }) => {

    return (
        <div className={'column is-narrow home columns ' + (address ? '': 'loading')}>
            <ListingPhoto hero={ hero } />
            <BasicInfo { ...{ address, price, sqft } } />

        </div>
   );
};

export default Listing;
