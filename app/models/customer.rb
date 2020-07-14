class Customer < ApplicationRecord
  has_many :orders

  belongs_to :user
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
end
