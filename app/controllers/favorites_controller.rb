class FavoritesController < ApplicationController
  include CurrentUserConcern

  def index
    @favorites = @current_user.products
    render json: {favProducts: @favorites }, status: :ok
  end

  def create
    favorite = Favorite.create!(
      user_id: params["user_id"],
      product_id: params["product_id"],
    )
    if favorite
      render json: {
        status: :created,
        favorite: favorite,
      }
    else 
      render json: {
        status: 500
      }
    end
  end

  def destroy
  end
end