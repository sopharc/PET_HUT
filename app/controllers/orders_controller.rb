class OrdersController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders
  end

  def new
    @order = Order.new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @order = Order.new(order_params)
    @order.customer = @customer
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
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
