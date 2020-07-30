class AddressesController < ApplicationController
  # before_action :set_customer
  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = Customer.where(customer: @customer)
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer = @customer
    if @address.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @address.update(address_params)
  end

  def destroy
    @address.destroy
    redirect_to customer_path(@customer)
  end

  private

  def address_params
    params.require(:address).permit(:default_delivery, :default_billing, :first_line, :second_line, :optional_line, :city, :postcode, :customer_id)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
