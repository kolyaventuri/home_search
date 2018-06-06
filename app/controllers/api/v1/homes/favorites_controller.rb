class Api::V1::Homes::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def index
    favorites = current_user.homes

    favorites = favorites.map do |home|
      home = HomeSerializer.new(home).serializable_hash[:data][:attributes]
      home.delete(:id)
      home[:favorite] = true
      home
    end

    render json: favorites
  end

  def update
    home = Home.find_by('StandardFields.ListingId': params[:id])
    return render json: { success: false } unless home

    result = false
    if current_user.home_ids.include?(home.id)
      current_user.homes.delete home
    else
      current_user.homes << home
      result = true
    end

    render json: { success: true, favorited: result }
  end

  private

  def require_user
    render json: { success: false }, status: 401 and return false unless current_user
  end
end
