class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  after_action :verify_policy_scoped, only: :index

  def index
    if params.has_key?(:query) && params[:query] != ""
      @products = policy_scope(Product).global_search(search_params[:query])
    elsif params.has_key?(:filter)
      @products = policy_scope(Product).where(category: search_params[:filter])
    else
      @products = policy_scope(Product)
    end
    @categories = policy_scope(Product).all_categories
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  private
  def search_params
    params.permit(:query, :filter)
  end
end
