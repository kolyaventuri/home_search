import PropTypes from 'prop-types'
import React from 'react'
import Listing from './ListingSearchResult'

export default class ListingSearchResults extends React.Component {
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
        let zip = window['_home_search_q'];
        fetch('/api/v1/homes/search?zip=' + zip).then(response => {
            return response.json();
        }).then(json => {
            let listings = json.results.map(home => {
                return {
                    hero: home.hero_shot,
                    address: home.first_line_address,
                    price: home.list_price,
                    baths: home.total_baths,
                    beds: home.total_beds,
                    garage: home.garage_spaces,
                    sqft: home.sqft,
                    lot_size: home.lot_size
                }
            });

            this.setState({ listings });
        });
    }

    render() {
        return this.state.listings.map(data => {
            let key = Math.random().toString(36);
            return (<Listing {...data} key={key} />);
        });
    }
}
