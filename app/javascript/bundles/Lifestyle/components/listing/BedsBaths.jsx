import React from 'react'
import Beds from './items/Beds'
import Baths from './items/Baths'
import Garage from './items/Garage'

const BedsBaths = ({ beds, baths, garage }) => {
    return (
        <div className='column is-narrow is-half columns'>
            <div className='column'>
                <div className='info'>
                    <Beds>{ beds }</Beds>
                    <Baths>{ baths }</Baths>
                    <Garage>{ garage }</Garage>
                </div>
            </div>
        </div>
    );
};

export default BedsBaths;
