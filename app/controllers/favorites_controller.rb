class FavoritesController < ApplicationController
  include CurrentUserConcern

  def index
    @favorites = Favorite.where(user_id: @current_user.id)
    render json: {products: @favorites }, status: :ok
  end
end