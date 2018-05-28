class Home < ApplicationRecord
  def self.from_json(json)
    home = new
    binding.pry
  end
end
