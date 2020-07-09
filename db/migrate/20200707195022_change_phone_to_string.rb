class ChangePhoneToString < ActiveRecord::Migration[6.0]
  def change
    change_column :customers, :phone_number, :string
    remove_column :customers, :user_id, :integer
    add_reference :customers, :user, foreign_key: true
  end
end
