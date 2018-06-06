class FavoritesController < ApplicationController
  def index
    redirect_to root_path and return false unless current_user
    render :index, layout: 'page'
  end
end
