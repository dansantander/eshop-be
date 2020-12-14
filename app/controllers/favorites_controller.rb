class FavoritesController < ApplicationController
  def index
    @current_user = User.find_by(id: params['user'])
    favorites = @current_user.products
    render json: { favProducts: favorites }, status: :ok
  end

  def create
    @current_user = User.find_by(id: params['user'])
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
    data = JSON.parse(request.raw_post)
    @current_user = User.find_by(id: data)
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
