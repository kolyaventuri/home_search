class RecommendationService
  def limits(parameters)
    parameters.transform_values do |v|
      v *= 10
      v = 50 if v > 50
      v = 10 if v < 10
      v
    end
  end
end
