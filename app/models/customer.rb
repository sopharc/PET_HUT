class Customer < ApplicationRecord
  has_many :orders
  has_many :addresses
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
end
