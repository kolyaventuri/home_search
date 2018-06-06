require 'rails_helper'

describe YelpService, type: :service do
  it 'should be able to make a request to the Yelp API' do
    VCR.use_cassette('yelp_request_test') do
      results = YelpService.new.make_request('/v3/businesses/search', { location: '87114' })

      expect(results).to be_a Hash
      expect(results[:businesses]).to be_an Array
    end
  end
end
