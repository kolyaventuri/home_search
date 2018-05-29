import React from 'react'
import Price from './Price'
import SqFt from './SqFt'

const BasicInfo = ({ address, price, sqft }) => {
    return (
        <div className='column is-narrow is-three-quarters columns'>
            <div className='column'>
                <div className='info'>
                    <p className="address">{ address }</p>
                    <Price>{ price }</Price>
                    <SqFt>{ sqft }</SqFt>
                </div>
            </div>
        </div>
    );
};

export default BasicInfo;
