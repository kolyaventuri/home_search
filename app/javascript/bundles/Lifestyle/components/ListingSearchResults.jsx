import PropTypes from 'prop-types'
import React from 'react'
import Listing from './ListingSearchResult'

export default class ListingSearchResults extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            listings: new Array(25).fill({}),
            pagination: {currentPage: 0, totalPages: null},
            loading: true
        };

        window.addEventListener('scroll', (e) => {
        });
    }

    componentDidMount() {
        window.addEventListener('scroll', this.onScroll, false);
        this.loadListings();
    }

    componentWillUnmount() {
        window.removeEventListener('scroll', this.onScroll, false);
    }

    onScroll = () => {
        if(this.state.pagination.currentPage >= this.state.pagination.totalPages) return;
        if(this.state.loading) return;

        let homes = document.querySelectorAll('.home');

        let last = homes[homes.length - 1];
        let bottom = last.getBoundingClientRect().bottom;

        if(bottom < window.innerHeight) {
            this.setState({
                loading: true,
                listings: this.state.listings.concat(new Array(25).fill({}))
            });
            this.loadListings();
        }
    }

    queryify(query) {
        let isZip = /^\b\d{5}(-\d{4})?\b$/.test(query);
        let queryParams = {};
        if(isZip) {
            queryParams['zip'] = query;
        } else {
            queryParams['address'] = query;
        }

        query = window.location.search.substr(1);
        query.split("&").forEach(function(part) {
            var item = part.split("=");
            if(item[1].length < 1) return;
            queryParams[item[0]] = decodeURIComponent(item[1]);
        });
        delete queryParams['q'];
        return Object.keys(queryParams).map(param => {
            return `${encodeURIComponent(param)}=${encodeURIComponent(queryParams[param])}`
        }).join('&');
    }

    loadListings() {
        let page = this.state.pagination.currentPage + 1;

        let query = this.queryify(window['_home_search_q']);

        fetch('/api/v1/homes/search?' + query + '&page=' + page).then(response => {
            return response.json();
        }).then(json => {
            let listings = json.results.map(home => {
                return {
                    hero_small: home.hero_shot_small,
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
            this.setState((prevState) => {
                let newListings = prevState;
                let point = 25 * this.state.pagination.currentPage;
                let nextPoint = point + 25;

                for(let listing of listings) {
                    newListings.listings[point++] = listing;
                }

                for(let i = point; point < nextPoint; point++) {
                    delete newListings.listings[point];
                }

                return {
                    listings: newListings.listings,
                    loading: false,
                    pagination: json.pagination
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
