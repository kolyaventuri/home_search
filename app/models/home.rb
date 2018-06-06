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
    home.save
    home
  end
end
