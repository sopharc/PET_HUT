class Product < ApplicationRecord
  has_one_attached :photo
  has_many :order_products
  # has_many :orders, through :order_products
  has_many :components, through: :product_materials
end
