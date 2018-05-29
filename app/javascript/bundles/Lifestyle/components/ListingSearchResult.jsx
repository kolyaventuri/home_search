import React from 'react'
import ListingPhoto from './listing/Photo'
import ListingInfo from './listing/Info'
import BasicInfo from './listing/BasicInfo'
import BedsBaths from './listing/BedsBaths'

const Listing = (props) => {
    return (
        <div className={'column is-narrow home columns ' + (props.address ? '': 'loading')}>
            <ListingPhoto hero={ props.hero } />
            <ListingInfo { ...props } />
        </div>
   );
};

export default Listing;
