class FavoritesController < ApplicationController
  def index
    render :index, layout: 'page'
  end
end
