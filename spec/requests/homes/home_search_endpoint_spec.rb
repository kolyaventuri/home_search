require 'rails_helper'

context 'When a request is made to /api/v1/homes/search' do
  let(:query) {
    { zip: 87114 }.to_query
  }

  let(:query_paginated) {
    { zip: 87114, page: 2 }.to_query
  }

  context 'with given parameters for page 1' do
    scenario 'a list of homes is returned' do
      VCR.use_cassette('home_search_1_p1', allow_unused_http_interactions: true) do
        get "/api/v1/homes/search?#{query}"

        expect(response).to be_successful

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result[:pagination][:CurrentPage]).to be(1)
        expect(result[:results].first[:list_price]).to_not be_nil
      end
    end
  end

  context 'with given parameters for page 2' do
    scenario 'more homes are returned' do
      VCR.use_cassette('home_search_1_p2', allow_unused_http_interactions: true) do
        get "/api/v1/homes/search?#{query_paginated}"

        expect(response).to be_successful

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result[:pagination][:CurrentPage]).to be(2)
        expect(result[:results].first[:list_price]).to_not be_nil
      end
    end
  end
end
