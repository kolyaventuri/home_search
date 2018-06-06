class RecommendationService
  def self.find_midpoint(location, rankings)
    rankings = new.limits(rankings)

    yelp_locations = []

    rankings.each_pair do |category, limit|
      items = YelpService.businesses(location, category)
      items[:businesses] = items[:businesses][0...limit]

      yelp_locations << items
    end

    midpoints = yelp_locations.map do |locations|
      LocationService.yelp_midpoint(locations)
    end

    LocationService.midpoint(midpoints)
  end

  def limits(parameters)
    parameters.transform_values do |v|
      v *= 10
      v = 50 if v > 50
      v = 10 if v < 10
      v
    end
  end
end

