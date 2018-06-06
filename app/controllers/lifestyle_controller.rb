class LifestyleController < ApplicationController
  def index
    session[:search_params] = search_params.to_json
  end

  private

  def search_params
    params.permit(
      :q,
      :minPrice,
      :maxPrice,
      :minBaths,
      :maxBaths,
      :minSqft,
      :maxSqft,
      :minBeds,
      :maxBeds
    )
  end
end
