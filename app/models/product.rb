class Product < ApplicationRecord
  has_one_attached :photo
  has_many :components, through: :product_materials
end
