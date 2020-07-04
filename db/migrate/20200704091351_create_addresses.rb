class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.boolean :default_delivery
      t.boolean :default_billing
      t.string :first_line
      t.string :second_line
      t.string :optional_line
      t.string :postcode
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
