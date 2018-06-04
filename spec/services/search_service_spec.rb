require 'rails_helper'

describe SearchService, type: :service do
  context 'should be able to handle specific filters' do
    scenario 'for zip code' do
      expect(SearchService.build_filter({ 'zip' => 87114 })).to include("PostalCode Eq '87114'")
    end

    scenario 'for min price' do
      expect(SearchService.build_filter({ 'minPrice' => 1500 })).to include("ListPrice Ge 1500")
    end

    scenario 'for max price' do
      expect(SearchService.build_filter({ 'maxPrice' => 1500 })).to include("ListPrice Le 1500")
    end

    scenario 'for min baths' do
      expect(SearchService.build_filter({ 'minBaths' => 1 })).to include("BathsTotal Ge 1")
    end

    scenario 'for max baths' do
      expect(SearchService.build_filter({ 'maxBaths' => 3 })).to include("BathsTotal Le 3")
    end

    scenario 'for min beds' do
      expect(SearchService.build_filter({ 'minBeds' => 3 })).to include("BedsTotal Ge 3")
    end

    scenario 'for max beds' do
      expect(SearchService.build_filter({ 'maxBeds' => 3 })).to include("BedsTotal Le 3")
    end

    scenario 'for min sqft' do
      expect(SearchService.build_filter({ 'minSqft' => 3 })).to include("BuildingAreaTotal Ge 3")
    end

    scenario 'for max sqft' do
      expect(SearchService.build_filter({ 'maxSqft' => 5 })).to include("BuildingAreaTotal Le 5")
    end
  end
end
