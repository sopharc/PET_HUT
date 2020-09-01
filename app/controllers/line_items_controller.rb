class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:edit, :update, :destroy]



  def new
    @line_item = LineItem.new
    authorize @line_item
  end

  def create
    set_cart

    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    if @line_item.save
      redirect_to @line_item.cart, notice: 'Item added to cart'
    else
      render :new
    end
    authorize @line_item
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    redirect_to cart_path(@cart)
    authorize @line_item
  end

  private

   def line_item_params
    params.require(:line_item).permit(:product_id)
   end

   def set_line_item
    @line_item = LineItem.find(params[:id])
   end
end
