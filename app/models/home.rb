class Home < ApplicationRecord
  validates_presence_of :spark_id
  validates_presence_of :mls_id
  validates_presence_of :list_price
  validates_presence_of :address
  validates_presence_of :total_baths
  validates_presence_of :total_beds
  validates_presence_of :garage_spaces
  validates_presence_of :lot_size
  validates_presence_of :sqft

  def self.from_json(json)
    home = new
    binding.pry
  end
end
