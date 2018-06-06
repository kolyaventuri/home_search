require 'rails_helper'

describe RecommendationService, type: :model do
  it 'should be able to set limits' do
    result = RecommendationService.new.limits({'food' => 3})

    expected = { 'food' => 30 }
    expect(result).to eq(expected)
  end

  it 'should be able to get a midpoint for the limits' do
    VCR.use_cassette('find_midpoints') do
      result = RecommendationService.find_midpoint('87114', { 'food' => 3 })

      binding.pry

      expect(result).to be_a Hash
      expect(result[:latitude]).to be_a Float
    end
  end
end
