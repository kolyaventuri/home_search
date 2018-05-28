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

        expect(result[:page][:current]).to be(1)
        expect(result[:results].first[:list_price]).to_not be_nil

        if first_home_requested.nil?
          first_home_requested = result[:results].first[:address]
        else
          exepct(first_home_requested).to_not eq(result[:results].first[:address])
        end
      end
    end
  end

  xcontext 'with given parameters for page 2' do
    scenario 'more homes are returned' do

      # Identical search to top test

      if first_home_requested.nil?
        first_home_requested = result[:results].first[:address]
      else
        exepct(first_home_requested).to_not eq(result[:results].first[:address])
      end
    end
  end
end
