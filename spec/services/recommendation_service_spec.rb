require 'rails_helper'

describe RecommendationService, type: :model do
  it 'should be able to set limits' do
    result = RecommendationService.new.limits({'food' => 3})

    expected = { 'food' => 30 }
    expect(result).to eq(expected)
  end
end
