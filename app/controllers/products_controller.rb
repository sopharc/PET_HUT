class ProductsController < ApplicationController
<<<<<<< HEAD
  def index
    @products = Product.all
=======
  skip_before_action :authenticate_user!, only: [ :show ]
  def show
    @product = Product.find(params[:id])
>>>>>>> master
  end
end
