import React from 'react'
import BasicInfo from './BasicInfo'
import BedsBaths from './BedsBaths'

const Info = ({ address, price, sqft, beds, baths, garage }) => {
    return (
        <div className='column is-narrow is-three-quarters columns info'>
            <BasicInfo { ...{ address, price, sqft } } />
            <BedsBaths { ...{ beds, baths, garage } } />
        </div>
    );
};

export default Info;
