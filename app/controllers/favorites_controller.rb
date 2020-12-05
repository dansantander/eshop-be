class FavoritesController < ApplicationController
  include CurrentUserConcern

  def index
    @favorites = @current_user.products
    render json: {favProducts: @favorites }, status: :ok
  end

  def create
    favorite = Favorite.create!(user_id: params["user_id"], product_id: params["product_id"])
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
    favorite = Favorite.find_by(user_id: params["user_id"], product_id: params["product_id"])
    if favorite.destroy
      render json: { status: 'favorite removed' }
    else
      render json: favorite.errors.messages.as_json, status: :not_acceptable
    end
  end
end