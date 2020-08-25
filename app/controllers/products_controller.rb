class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  after_action :verify_policy_scoped, only: :index

  def index
    # @filter = params[:query] if params.has_key?(:query)

    if params.has_key?(:query) && params[:query] != ""
      @products = policy_scope(Product).global_search(search_params[:query])
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
    params.permit(:query)
  end
end
