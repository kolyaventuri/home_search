class Home < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :Id
  validates_uniqueness_of :Id

  field :location, type: Array
  index({ location: "2d" }, { min: -200, max: 200 })

  def serialize
    HomeSerializer.new(self).serializable_hash[:data][:attributes]
  end

  def self.from_json(json)
    home = create
    home.write_attributes(json)
    home.location = [
      json[:StandardFields][:Longitude],
      json[:StandardFields][:Latitude]
    ]
    home.save
    home
  end

  def self.radius_search(location, radius)
    radius_radians = radius / 3963.2
    collection.find(
      location: {
        '$geoWithin' => {
          '$centerSphere' => [
            location,
            radius_radians
          ]
        }
      }
    )
  end
end
