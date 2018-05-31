class Home < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :Id
  validates_uniqueness_of :Id

  def self.from_json(json)
    home = create
    home.write_attributes(json)
    home.save
    home
  end
end
