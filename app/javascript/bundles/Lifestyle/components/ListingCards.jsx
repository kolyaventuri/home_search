import PropTypes from 'prop-types'
import React from 'react'
import ListingCard from './ListingCard'

export default class ListingCards extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            loading: true,
            listings: []
        };
    }

    render() {
        return (
          <div>
            { this.state.listings.map(data => (
                <ListingCard {...data} />
            ))}
          </div>
        );
    }
}
