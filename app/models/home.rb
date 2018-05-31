class Home
  include Mongoid::Document
  validates_presence_of :spark_id
  validates_presence_of :mls_id
  validates_presence_of :list_price
  validates_presence_of :address
  validates_presence_of :first_line_address
  validates_presence_of :total_baths
  validates_presence_of :total_beds
  validates_presence_of :garage_spaces
  validates_presence_of :lot_size
  validates_presence_of :sqft

  def self.from_json(data)
    home = new
    standard_fields = data[:StandardFields]

    home.spark_id = data[:Id]
    home.mls_id = standard_fields[:ListingId]
    home.list_price = standard_fields[:ListPrice]
    home.address = standard_fields[:UnparsedAddress]
    home.first_line_address = standard_fields[:UnparsedFirstLineAddress]
    home.total_baths = standard_fields[:BathsTotal]
    home.total_beds = standard_fields[:BedsTotal]
    home.garage_spaces = standard_fields[:GarageSpaces]
    home.lot_size = standard_fields[:LotSizeAcres]
    home.sqft = standard_fields[:BuildingAreaTotal]
    unless standard_fields[:Photos].empty?
      home.hero_shot = standard_fields[:Photos].first[:Uri640]
      home.hero_shot_small = standard_fields[:Photos].first[:UriThumb]
    end

    home
  end
end
