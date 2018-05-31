require 'rails_helper'

describe Home, type: :model do

  it 'should be able to load a home from JSON' do
    home_json = File.read('fixtures/home.json')
    data = JSON.parse(home_json, symbolize_names: true)

    home = Home.from_json(data)

    expect(home).to be_a Home
    expect(home).to be_valid

    standard_fields = data[:StandardFields]

    expect(home.Id).to eq(data[:Id])
    expect(home.StandardFields[:ListingId]).to eq(standard_fields[:ListingId])
  end
end
