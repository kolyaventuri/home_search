import React from 'react'

export default class Listing extends React.Component {
    render({ hero, address, price}) {
        return (
            <div class="home">
                <div data-attribute="hero"><img src={hero} /></div>
                <p data-attribute="address">{ address }</p>
                <p data-attribute="price"> { price }</p>
            </div>
        );
    }
}
