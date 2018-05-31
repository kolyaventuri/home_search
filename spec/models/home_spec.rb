require 'rails_helper'

describe Home, type: :model do

  it 'should be able to load a home from JSON' do
    home_json = File.read('fixtures/home.json')
    data = JSON.parse(home_json, symbolize_names: true)

    home = Home.from_json(data)

    expect(home).to be_a Home
    expect(home).to be_valid

    standard_fields = data[:StandardFields]

    expect(home.spark_id).to eq(data[:Id])
    expect(home.mls_id).to eq(standard_fields[:ListingId])
    expect(home.list_price).to eq(standard_fields[:ListPrice])
    expect(home.address).to eq(standard_fields[:UnparsedAddress])
    expect(home.first_line_address).to eq(standard_fields[:UnparsedFirstLineAddress])
    expect(home.total_baths).to eq(standard_fields[:BathsTotal])
    expect(home.total_beds).to eq(standard_fields[:BedsTotal])
    expect(home.garage_spaces).to eq(standard_fields[:GarageSpaces])
    expect(home.lot_size).to eq(standard_fields[:LotSizeAcres])
    expect(home.sqft).to eq(standard_fields[:BuildingAreaTotal])
    expect(home.hero_shot).to eq(standard_fields[:Photos].first[:Uri640])
    expect(home.hero_shot_small).to eq(standard_fields[:Photos].first[:UriThumb])
  end
end
