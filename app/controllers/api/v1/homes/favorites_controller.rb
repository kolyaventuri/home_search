class Api::V1::Homes::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    return render json: { success: false }, status: 401 unless current_user

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
end
