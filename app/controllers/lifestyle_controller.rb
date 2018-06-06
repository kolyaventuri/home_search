class LifestyleController < ApplicationController
  def index
    session[:search_params] = search_params.to_json
    @nums = gen_nums(5)
  end

  def create
    params = JSON.parse(session[:search_params])
    midpoint = RecommendationService.find_midpoint(params['q'], ranking_params)

    params.delete('q')
    params['location'] = midpoint.values.join(',')
    params['radius'] = 25

    redirect_to "#{search_path}?#{params.to_query}"
  end

  private

  def gen_nums(max)
    nums = Array.new(max)

    nums = nums.map.with_index do |n, index|
      [index + 1, index + 1]
    end

    nums
  end


  private

  def ranking_params
    params.require(:importance).permit(
      :food,
      :entertainment,
      :active
    ).transform_values(&:to_i)
  end

  def search_params
    params.permit(
      :q,
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
