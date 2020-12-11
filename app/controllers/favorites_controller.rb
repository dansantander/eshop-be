class FavoritesController < ApplicationController
  include CurrentUserConcern

  def index
    favorites = @current_user.products
    render json: { favProducts: favorites }, status: :ok
  end

  def create
    favorite = Favorite.create!(user_id: @current_user.id, product_id: params['product_id'])
    favorites = @current_user.products
    if favorite
      render json: {
        status: :created,
        favProducts: favorites
      }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: @current_user.id, product_id: params['id'])
    favorites = @current_user.products
    if favorite.destroy
      render json: {
        status: :removed,
        favProducts: favorites
      }
    else
      render json: { status: 500 }
    end
  end
end
