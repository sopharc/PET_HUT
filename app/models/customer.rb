class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
end
