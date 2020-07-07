class ProductsController < ApplicationController
  # no need to sign in to see index and show
  skip_before_action :authenticate_user!, only: :index, :show
  # only admin can create, update and destroy
  before_filter :authorize_admin, only: :create, :update, :destroy


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @order_product = OrderProduct.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    # update to product index once routes are done
    redirect_to root_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @order_product = OrderProduct.new
    @product = Product.find(params[:id])
    @order_products = OrderProduct.white(product: @product)
    @component = Component.new
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    # change redirect to products index once routes are done
    redirect_to root_path

  private

  def product_params
    params.require(:product).permit(:name, :category, :price, :description, :dimensions)

end
