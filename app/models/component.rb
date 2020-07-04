class Component < ApplicationRecord
  has_many :products, through: :product_materials
end
