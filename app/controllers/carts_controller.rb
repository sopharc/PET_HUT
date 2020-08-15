class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invallid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]


  def show
    authorize @cart
  end

  def new
    @cart = Cart.new
    authorize @cart
  end

  def create
    @cart = Cart.new(cart_params)
    authorize @cart
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to products_url
    authorize @cart
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
  end
end
