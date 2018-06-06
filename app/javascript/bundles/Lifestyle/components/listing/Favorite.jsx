import React from 'react'

export default class Favorite extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            favorited: props.favorited,
        };
    }

    toggleFavorite() {
        fetch(`/api/v1/homes/favorite/${this.props.id}`, { method: 'PUT', credentials: 'same-origin' })
        .then(response => {
            return response.json();
        })
        .then(data => {
            console.log(data);
            if(!data.success) return;
            this.setState((prevState) => {
                return {
                    favorited: data.favorited
                };
            });
        });
    }

    render() {
        if(typeof this.state.favorited === 'undefined') return null;
        let fa_class = this.state.favorited ? 'fas' : 'far';

        return (
            <span className="icon is-large has-text-danger favorite-icon" onClick={this.toggleFavorite.bind(this)}>
                <i className={fa_class + ' fa-2x fa-heart'}></i>
            </span>
        );
    }
}
