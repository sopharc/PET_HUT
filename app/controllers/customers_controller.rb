class CustomersController < ApplicationController

skip_before_action :authenticate_user!, only: [:new]

  def new
    @customer = Customer.new
    authorize @customer
  end

  def show
    authorize @customer
  end


  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user

    authorize @customer

    if @customer.save
       mail = User.mailer.with(user: user).create_confirmation
       mail.deliver_now
      redirect_to products_path, notice: 'Account successfully created!'
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:user_id, :phone_number, :first_name, :last_name)
  end

end
