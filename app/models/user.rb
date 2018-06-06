class User < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :uid
  validates_uniqueness_of :uid

  has_and_belongs_to_many :homes, inverse_of: nil

  def self.from_omniauth(auth_info)

    find_or_create_by(uid: auth_info['uid']).update(auth_info)
    find_by(uid: auth_info['uid'])
  end
end
