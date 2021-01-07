class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: { products: @products }, status: :ok
  end

  def my_products
    current_user = User.find_by(id: params['user'])
    products = current_user.created_products
    render json: { my_products: products }, status: :ok
  end

  def create
    current_user = User.find_by(id: params['user'])
    product = current_user.created_products.create!(product_params)

    if product
      render json: { product: product }, status: :ok
    else
      render json: { errors: 'Unable to upload product' }, status: :not_acceptable
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render json: @product, status: :ok
  end

  def destroy
    data = JSON.parse(request.raw_post)
    current_user = User.find_by(id: data)
    product = current_user.created_products.find_by(id: params['id'])
    products = current_user.created_products
    if product.destroy
      render json: {
        success: 'Product removed from Favorites',
        my_products: products
      }
    else
      render json: { errors: 'Product not removed from Favorites' }, status: :not_acceptable
    end
  end


  private

  def product_params
    params.require(product).permit(:name, :description, :price)
  end
end
