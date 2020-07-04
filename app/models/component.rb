class Component < ApplicationRecord
  has_many :products through: :product_material
end
