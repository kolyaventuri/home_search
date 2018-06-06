class User < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :uid
  validates_uniqueness_of :uid

end
