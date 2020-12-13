class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: { products: @products }, status: :ok
  end

  def show
    @product = Product.find_by(id: params[:id])
    render json: @product, status: :ok
  end
end
