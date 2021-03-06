require 'rails_helper'

context 'When a request is made to /api/v1/homes/featured' do
  scenario 'a list of Home objects in JSON format is returned' do
    VCR.use_cassette('featured_homes', allow_unused_http_interactions: true) do
      get '/api/v1/homes/featured'

      expect(response).to be_successful

      homes = JSON.parse(response.body, symbolize_names: true)

      expect(homes).to be_an Array
      home = homes.first

      expect(home[:list_price]).to_not be_nil
      expect(home[:address]).to_not be_nil
      # There's so much home data and not all of it is guaranteed to
      # come through so there's only so much that we can actually test for.

      # Plots of land come through in the results by default, and they are missing
      # A lot of values like TotalBaths that a home will have
    end
  end
end
