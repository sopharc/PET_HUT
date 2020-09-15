class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_customer, only: [:index]
  before_action :set_cart, only: [ :create ]

  def index
    @orders = @customer.orders
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new
    @order.customer = current_user.customer
    @order.update(cart_id: @cart.id)
    @order.save


    session = Stripe::Checkout::Session.create({
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel',
      payment_method_types: ['card'],
      line_items: @cart.line_items_for_stripe,
      mode: 'payment',
    })


    @order.update(checkout_session_id: session.id)

    redirect_to new_order_payment_path(@order)
    authorize @order
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
    params.require(:order).permit(:cart_id )
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
