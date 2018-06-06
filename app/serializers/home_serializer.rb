class HomeSerializer
  include FastJsonapi::ObjectSerializer

  attribute :id

  attribute_map = {
    list_price: :ListPrice,
    mls_id: :ListingId,
    address: :UnparsedAddress,
    first_line_address: :UnparsedFirstLineAddress,
    total_baths: :BathsTotal,
    total_beds: :BedsTotal,
    garage_spaces: :GarageSpaces,
    lot_size: :LotSizeAcres,
    sqft: :BuildingAreaTotal
  }

  attribute_map.each_pair do |key, value|
    attribute key do |object|
      object.StandardFields[value]
    end
  end

  attribute :hero_shot do |object|
    begin
      object.StandardFields[:Photos].first[:Uri640]
    rescue
      nil
    end
  end


  attribute :hero_shot_small do |object|
    begin
      object.StandardFields[:Photos].first[:UriThumb]
    rescue
      nil
    end
  end

end
