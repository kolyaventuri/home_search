class LifestyleController < ApplicationController
  def index
    session[:search_params] = search_params.to_json
    @nums = gen_nums(5)
  end

  def create
    q = JSON.parse(session[:search_params])['q']


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
