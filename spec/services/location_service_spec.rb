require 'rails_helper'

describe LocationService, type: :service do
  it 'should be able to get an average lat/long for a given list of locations from yelp' do
    data = File.read('./fixtures/yelp.json')
    json = JSON.parse(data, symbolize_names: true)

    result = LocationService.yelp_midpoint(json)

    expected = {
      latitude: 35.16336319884125,
      longitude: -106.6222967196353
    }

    expect(result).to eq(expected)
  end
end
