class PaymentsController < ApplicationController
  include CurrentCart
  def new
    @order = current_user.customer.orders.where(status: 'pending').find(params[:order_id])
    authorize @order
  end
end
