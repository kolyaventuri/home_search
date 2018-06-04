class Api::V1::Homes::SearchController < ApplicationController
  def index
    render json: SearchService.search(search_params)
  end

  private

  def search_params
    params.permit(
      :page,
      :zip,
      :address,
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
