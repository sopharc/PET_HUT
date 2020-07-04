class OrderController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save

    redirect_to order_path
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to order_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :order_date, :status, :dispatch_date)
  end
end
