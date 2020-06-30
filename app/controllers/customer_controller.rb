class CustomerController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new
    @customer.save

  end


  def edit

  end
end
