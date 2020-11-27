class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: { products: @products }, status: :ok
  end

  def show
    @product = Product.where(name: params[:name])
    render json: @product, status: :ok
  end
end
