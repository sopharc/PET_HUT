class ChangeOrdersToReferenceCUstomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :customer_id, :integer
    add_reference :orders, :customer, foreign_key: true
  end
end
