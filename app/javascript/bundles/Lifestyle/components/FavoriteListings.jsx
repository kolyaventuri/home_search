import PropTypes from 'prop-types'
import React from 'react'
import Listing from './ListingSearchResult'

export default class FavoriteListings extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listings: new Array(25).fill({}),
            loading: true
        };
    }

    componentDidMount() {
        this.loadListings();
    }

    loadListings() {
        fetch('/api/v1/homes/favorites', {credentials: 'same-origin'}).then(response => {
            return response.json();
        }).then(results => {
            let listings = results.map(home => {
                return {
                    id: home.mls_id,
                    hero_small: home.hero_shot_small,
                    hero: home.hero_shot,
                    address: home.first_line_address,
                    price: home.list_price,
                    baths: home.total_baths,
                    beds: home.total_beds,
                    garage: home.garage_spaces,
                    sqft: home.sqft,
                    lot_size: home.lot_size,

                    favorited: home.favorite
                }
            });
            this.setState((prevState) => {
                return {
                    listings: listings,
                    loading: false
                };
            });
        });
    }

    render() {
        return this.state.listings.map(data => {
            let key = Math.random().toString(36);
            return (<Listing {...data} key={key} />);
        });
    }
}
