class Order < ApplicationRecord
  belongs_to :customer
  has_one :cart
end
