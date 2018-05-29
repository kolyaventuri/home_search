import React from 'react'

const Photo = ({ hero }) => {
    const listingStyle = {
        backgroundImage: 'url(' + hero + ')',
        backgroundSize: 'cover',
        backgroundRepeat: 'no-repeat'
    };

    return (
        <div className='column is-narrow is-one-quarter'>
            <div className='hero' style={hero ? listingStyle : {}}></div>
        </div>
    );
};

export default Photo;
