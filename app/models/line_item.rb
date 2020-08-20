class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # total helper from vid, needs improving
  def total_price
    product.price * quantity
  end
end
