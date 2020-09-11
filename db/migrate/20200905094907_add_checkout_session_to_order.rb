class AddCheckoutSessionToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :checkout_session_id, :string
    add_reference :orders, :cart, foreign_key: true
  end
end
