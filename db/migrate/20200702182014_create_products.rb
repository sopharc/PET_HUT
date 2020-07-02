class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :price
      t.text :description
      t.string :dimensions

      t.timestamps
    end
  end
end
