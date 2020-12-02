class FavoritesController < ApplicationController
  include CurrentUserConcern

  def index
    @favorites = Favorite.where(user_id: @current_user.id)
    render json: {favProducts: @favorites }, status: :ok
  end
end