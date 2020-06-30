class CustomerController < ApplicationController
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

  private

  def customer_params
    params.require(:customer).permit(:user_id, :phone_number, :first_name, :last_name)
  end

end
