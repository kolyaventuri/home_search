import React from 'react'
import ListingPhoto from './listing/Photo'
import BasicInfo from './listing/BasicInfo'

const Listing = ({ hero, address, price }) => {

    return (
        <div className={'column is-narrow home columns ' + (address ? '': 'loading')}>
            <ListingPhoto hero={ hero } />
            <BasicInfo address={ address } price={ price } />
        </div>
   );
};

export default Listing;
