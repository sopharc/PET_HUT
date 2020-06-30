class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.date :order_date
      t.string :status
      t.date :dispatch_date

      t.timestamps
    end
  end
end
