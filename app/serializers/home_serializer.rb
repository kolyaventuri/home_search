class HomeSerializer
  include FastJsonapi::ObjectSerializer

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
end
