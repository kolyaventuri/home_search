require 'rails_helper'

describe Home, type: :model do

  let(:data) {
    home_json = File.read('fixtures/home.json')
    JSON.parse(home_json, symbolize_names: true)
  }

  it 'should be able to load a home from JSON' do
    home = Home.from_json(data)

    expect(home).to be_a Home
    expect(home).to be_valid

    standard_fields = data[:StandardFields]

    expect(home.Id).to eq(data[:Id])
    expect(home.StandardFields[:ListingId]).to eq(standard_fields[:ListingId])
  end

  it 'should not be able to create duplicate homes' do
    home = Home.from_json(data)
    expect(home).to be_valid

    home2 = Home.from_json(data)
    expect(home2).to_not be_valid
  end

  it 'should have a geocoded location' do
    home = Home.from_json(data)

    expect(home.location).to eq([data[:StandardFields][:Longitude], data[:StandardFields][:Latitude]])
  end

end
