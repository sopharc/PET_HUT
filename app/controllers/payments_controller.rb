class PaymentsController < ApplicationController
  def new
    @order = current_user.customer.orders.where(status: 'pending').find(params[:order_id])
    authorize @order
  end
end
