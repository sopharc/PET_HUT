class CustomerController < ApplicationController

  def show
    @address = Address.new
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer: @customer.id)
    @order= Order.new
    @address_details = Address.where(customer: @customer).map do |address|
      [ address.default_delivery? ? "Delivery Address" : "Billing Address", " - #{address.first_line}, #{address.second_line}, #{address.optional_line}, #{address.city}, #{address.postcode}", address.id]
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save

    redirect_to home_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end

  # if they want to delete their account?
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to products_path
  end

  private

  def customer_params
    params.require(:customer).permit(:user_id, :phone_number, :first_name, :last_name)
  end

end
