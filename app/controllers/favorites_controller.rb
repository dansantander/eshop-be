class FavoritesController < ApplicationController
  include CurrentUserConcern

  def index
    # @favorites = Favorite.where(user_id: @current_user.id)
    @favorites = @current_user.products
    render json: {favProducts: @favorites }, status: :ok
  end
end