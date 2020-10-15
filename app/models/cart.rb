class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # monetize :amount_cents

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.new(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def line_items_for_stripe
    bop = []
    self.line_items.each do |line_item|
      bop << {amount: line_item.product.price_cents, quantity: line_item.quantity, currency: 'EUR', name: line_item.product.name }
    end
    return bop
  end
end
