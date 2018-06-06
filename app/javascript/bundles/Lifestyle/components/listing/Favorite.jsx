import React from 'react'

const Favorite = ({ favorited }) => {
    if(typeof favorited === 'undefined') return null;
    let fa_class = favorited ? 'fas' : 'far';
    return (
        <span className="icon is-large has-text-danger">
            <i className={fa_class + ' fa-2x fa-heart'}></i>
        </span>
    );
};

export default Favorite;
