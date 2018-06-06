import React from 'react'
import ListingPhoto from './listing/Photo'
import ListingInfo from './listing/Info'
import BasicInfo from './listing/BasicInfo'
import BedsBaths from './listing/BedsBaths'
import Favorite from './listing/Favorite'

const Listing = (props) => {
    return (
        <div className={'column is-narrow home columns ' + (props.address ? '': 'loading')}>
            <Favorite favorited={ props.favorited } />
            <ListingPhoto { ...props } />
            <ListingInfo { ...props } />
        </div>
   );
};

export default Listing;
