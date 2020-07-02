class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :material
      t.string :colour
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
