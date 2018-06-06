require 'rails_helper'

describe YelpService, type: :service do
  it 'should be able to make a request to the Yelp API' do
    VCR.use_cassette('yelp_request_test') do
      results = YelpService.new.make_request('/v3/businesses/search', { location: '87114' })

      expect(results).to be_a Hash
      expect(results[:businesses]).to be_an Array
    end
  end

  it 'should be able to get an average lat/long for a given list of locations' do
    data = File.read('./fixtures/yelp.json')
    json = JSON.parse(data, symbolize_names: true)

    result = YelpService.calculate_midpoint(json)

    expected = {
      latitude: 35.16336319884125,
      longitude: -106.6222967196353
    }

    expect(result).to be(expected)
  end
end
