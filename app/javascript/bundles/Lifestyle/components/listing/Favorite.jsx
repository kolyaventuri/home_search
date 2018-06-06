import React from 'react'

const Favorite = ({ favorited }) => {
    if(typeof favorited === 'undefined') return null;
    return (
        <p>Favorite? { favorited ? 'yes' : 'no' }</p>
    );
};

export default Favorite;
