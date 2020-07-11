class Address < ApplicationRecord
  belongs_to :customer

  validates :first_line, presence: true
  validates :postcode, presence: true
end
