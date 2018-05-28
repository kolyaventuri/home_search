class Api::V1::Homes::FeaturedController < ApplicationController
  def index
    homes = SparkService.featured

    render json: homes
  end
end
