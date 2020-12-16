class FavoritesController < ApplicationController
  def index
    current_user = User.find_by(id: params['user'])
    favorites = current_user.products
    render json: { favProducts: favorites }
  end

  def create
    current_user = User.find_by(id: params['user'])
    favorite = Favorite.create!(user_id: current_user.id, product_id: favorite_params[:product_id])
    favorites = current_user.products
    if favorite
      render json: {
        success: 'Product added to Favorites',
        favProducts: favorites
      }
    else
      render json: { errors: 'Product not added to Favorites' }, status: :not_acceptable
    end
  end

  def destroy
    data = JSON.parse(request.raw_post)
    current_user = User.find_by(id: data)
    favorite = Favorite.find_by(user_id: current_user.id, product_id: params['id'])
    favorites = current_user.products
    if favorite.destroy
      render json: {
        success: 'Product removed from Favorites',
        favProducts: favorites
      }
    else
      render json: { errors: 'Product not removed from Favorites' }, status: :not_acceptable
    end
  end

  private

  def favorite_params
    params.permit(:user, :product_id)
  end
end
