import React from 'react'
import Price from './Price'

export default class Listing extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            address: props.address,
            price: props.price,
            hero: props.hero_small
        };
    }

    componentDidMount() {
        let image = new Image();

        image.onload = () => {
            this.setState({ hero: this.props.hero });
        };

        image.src = this.props.hero;
    }

    render() {
        const listingStyle = {
            backgroundImage: 'url(' + this.state.hero + ')',
            backgroundSize: 'cover',
            backgroundRepeat: 'no-repeat',
            backgroundPosition: 'center center'
        };

        return (
            <div className={'column is-narrow is-one-quarter home ' + (this.state.address ? '': 'loading')}>
                <div className="hero" style={this.state.address ? listingStyle : {}}></div>
                <div className='info'>
                    <p className="address">{ this.state.address }</p>
                    <Price>{ this.state.price }</Price>
                </div>
            </div>
        );
    }
}
