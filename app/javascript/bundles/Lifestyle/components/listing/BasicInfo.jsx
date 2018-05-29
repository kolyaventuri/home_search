import React from 'react'
import Price from '../Price'

const BasicInfo = ({ address, price }) => {
    return (
        <div className='column is-narrow is-three-quarters columns'>
            <div className='column'>
                <div className='info'>
                    <p className="address">{ address }</p>
                    <Price>{ price }</Price>
                </div>
            </div>
        </div>
    );
};

export default BasicInfo;
