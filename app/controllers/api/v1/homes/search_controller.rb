class Api::V1::Homes::SearchController < ApplicationController
  def index
    search_results = SearchService.search(search_params)

    if current_user
      search_results[:results].map! do |home|
        home[:favorite] = !current_user.homes.where(Id: home[:Id]).empty?
        home
      end
    end

    render json: search_results
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
