class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all
    @products = Product.filter_by_category(params[:category]) if params[:category].present?
    @products = policy_scope(Product)
  end

  def show
    @product = Product.find(params[:id])
  end
end
