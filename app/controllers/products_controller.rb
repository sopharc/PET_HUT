class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  after_action :verify_policy_scoped, only: :index

  def index
    # @filter = params[:query] if params.has_key?(:query)
    @products = policy_scope(Product)
    # if params.has_key?(:query)
    #   @products = Product.where(category: params[:query])
    # else
    #   @products = Product.all
    # end
  end

  def show
    @product = Product.find(params[:id])
    authorize Product
  end

  private
  def search_params
    params.require(:product).permit(:query)
  end
end
