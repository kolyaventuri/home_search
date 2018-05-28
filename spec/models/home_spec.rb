require 'rails_helper'

describe Home, type: :model do
  it 'should be able to load a home from JSON' do
    home_json = File.read('fixtures/home.json')

    home = Home.from_json(home_json)

    expect(home).to be_a Home

    standard_fields = home_json[:StandardFields]

    expect(home.spark_id).to eq(home_json[:Id])
    expect(home.mls_id).to eq(standard_fields[:ListingId])
    expect(home.list_price).to eq(standard_fields[:ListPrice])
    expect(home.address).to eq(standard_fields[:UnparsedAddress])
    expect(home.total_baths).to eq(standard_fields[:BathsTotal])
    expect(home.total_beds).to eq(standard_fields[:BedsTotal])
    expect(home.garage_spaces).to eq(standard_fields[:GarageSpaces])
    expect(home.lot_size).to eq(standard_fields[:LotSizeAcres])
    expect(home.sqft).to eq(standard_fields[:BuildingAreaTotal])
  end
end
