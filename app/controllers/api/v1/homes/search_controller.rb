class Api::V1::Homes::SearchController < ApplicationController
  def index
    render json: SparkService.search(search_params)
  end

  private

  def search_params
    params.permit(
      :zip,
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
