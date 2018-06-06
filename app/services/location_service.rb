class LocationService

  def self.yelp_midpoint(json)
    coords = json[:businesses].map do |business|
      business[:coordinates].values
    end

    new.calculate_midpoint(coords)
  end

  def self.midpoint(points)
    new.calculate_midpoint(points.map(&:values))
  end

  def calculate_midpoint(coords)
    {
      latitude: coords.map(&:first).sum / coords.length,
      longitude: coords.map(&:last).sum / coords.length
    }
  end
end
