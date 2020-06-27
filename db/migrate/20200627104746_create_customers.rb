class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.integer :phone_number
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
