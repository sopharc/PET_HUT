class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @products = Product.where(category: params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def search_params
    params.require(:product).permit(:query)
  end
end
