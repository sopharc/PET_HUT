class Customer < ApplicationRecord
  has_many :orders
  has_many :addresses

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
end
