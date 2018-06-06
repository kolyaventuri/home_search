class Api::V1::Homes::SearchController < ApplicationController
  def index
    search_results = SearchService.search(search_params)
    if current_user
      home_ids = current_user.home_ids.map(&:to_s)

      search_results[:results].map! do |home|
        home[:favorite] = home_ids.include?(home[:id].to_s) if current_user
        home.delete(:id)
        home
      end
    end

    render json: search_results
  end

  private

  def search_params
    params.permit(
      :page,
      :location,
      :radius,
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
