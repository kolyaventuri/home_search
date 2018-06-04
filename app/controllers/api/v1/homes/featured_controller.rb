class Api::V1::Homes::FeaturedController < ApplicationController
  def index
    homes = SearchService.featured

    render json: homes
  end
end
