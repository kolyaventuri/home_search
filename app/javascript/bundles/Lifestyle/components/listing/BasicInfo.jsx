import React from 'react'
import Price from './Price'
import SqFt from './SqFt'
import Address from './Address'

const BasicInfo = ({ address, price, sqft }) => {
    return (
        <div className='column is-narrow is-three-quarters columns'>
            <div className='column'>
                <div className='info'>
                    <Address>{ address }</Address>
                    <Price>{ price }</Price>
                    <SqFt>{ sqft }</SqFt>
                </div>
            </div>
        </div>
    );
};

export default BasicInfo;
