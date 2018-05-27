require 'rails_helper'

context 'When a request is made to /api/v1/homes/featured' do
  describe 'a list of Home objects in JSON format is returned' do
    get '/api/v1/homes/featured'

    expect(response).to be_successful

    homes = JSON.parse(response.body, symbolize_names: true)

    expect(homes).to be_an Array
    home = homes.first

    expect(home[:ListPrice]).to_not be_nil
    expect(home[:UnparsedAddress]).to_not be_nil
    # There's so much home data and not all of it is guaranteed to
    # come through so there's only so much that we can actually test for.

    # Plots of land come through in the results by default, and they are missing
    # A lot of values like TotalBaths that a home will have
  end
end
