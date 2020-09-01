module CurrentCart

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound || ActiveRecord::Relation.empty?
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

end
