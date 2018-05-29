import PropTypes from 'prop-types'
import React from 'react'
import ListingCard from './ListingCard'

export default class ListingCards extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            loading: true,
            listings: new Array(10).fill({})
        };
    }

    componentDidMount() {
        this.loadListings();
    }

    loadListings() {
    }

    render() {
        return (
          <div className='columns is-multiline is-centered'>
            { this.state.listings.map(data => (
                <ListingCard {...data} />
            ))}
          </div>
        );
    }
}
