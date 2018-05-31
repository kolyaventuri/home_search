require 'rails_helper'

describe SparkService, type: :service do
  it 'should be able to build filters' do
    params_1 = { 'zip' => 87114 }
    params_2 = { 'zip' => 87114, 'minPrice' => 1500 }
    params_3 = { 'zip' => 87114, 'minPrice' => 1500, 'maxPrice' => 2000 }

    expect(SparkService.build_filter(params_1)).to include("PostalCode Eq '#{params_1['zip']}'")

    expect(SparkService.build_filter(params_2)).to include("PostalCode Eq '#{params_2['zip']}' And ListPrice Ge #{params_2['minPrice']}")

    expect(SparkService.build_filter(params_3)).to include("PostalCode Eq '#{params_3['zip']}' And ListPrice Ge #{params_3['minPrice']} And ListPrice Le #{params_3['maxPrice']}")
  end

  context 'should be able to handle specific filters' do
    scenario 'for zip code' do
      expect(SparkService.build_filter({ 'zip' => 87114 })).to include("PostalCode Eq '87114'")
    end

    scenario 'for min price' do
      expect(SparkService.build_filter({ 'minPrice' => 1500 })).to include("ListPrice Ge 1500")
    end

    scenario 'for max price' do
      expect(SparkService.build_filter({ 'maxPrice' => 1500 })).to include("ListPrice Le 1500")
    end

    scenario 'for min baths' do
      expect(SparkService.build_filter({ 'minBaths' => 1 })).to include("BathsTotal Ge 1")
    end

    scenario 'for max baths' do
      expect(SparkService.build_filter({ 'maxBaths' => 3 })).to include("BathsTotal Le 3")
    end

    scenario 'for min beds' do
      expect(SparkService.build_filter({ 'minBeds' => 3 })).to include("BedsTotal Ge 3")
    end

    scenario 'for max beds' do
      expect(SparkService.build_filter({ 'maxBeds' => 3 })).to include("BedsTotal Le 3")
    end

    scenario 'for min sqft' do
      expect(SparkService.build_filter({ 'minSqft' => 3 })).to include("BuildingAreaTotal Ge 3")
    end

    scenario 'for max sqft' do
      expect(SparkService.build_filter({ 'maxSqft' => 5 })).to include("BuildingAreaTotal Le 5")
    end
  end
end
