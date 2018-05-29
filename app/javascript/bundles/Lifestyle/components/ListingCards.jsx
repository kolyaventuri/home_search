import PropTypes from 'prop-types'
import React from 'react'
import ListingCard from './ListingCard'

export default class ListingCards extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listings: new Array(10).fill({})
        };
    }

    componentDidMount() {
        this.loadListings();
    }

    loadListings() {
        fetch('/api/v1/homes/featured').then(response => {
            return response.json();
        }).then(json => {
            let listings = json.map(home => {
                return {
                    hero: home.hero_shot,
                    address: home.first_line_address,
                    price: home.list_price
                }
            });

            this.setState({ listings });
        });
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
